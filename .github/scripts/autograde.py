#!/usr/bin/env python3
import argparse
import json
import subprocess
from datetime import datetime
from pathlib import Path

MYSQL_HOST = '127.0.0.1'
MYSQL_USER = 'root'
MYSQL_PASSWORD = 'root'
DATABASE = 'autograde'


def run_mysql_script(script_path: Path):
    cmd = [
        'mysql',
        f'-h{MYSQL_HOST}',
        f'-u{MYSQL_USER}',
        f'-p{MYSQL_PASSWORD}',
        f'-D{DATABASE}',
        '--batch',
        '--skip-column-names',
        '--default-character-set=utf8mb4'
    ]
    with script_path.open('r', encoding='utf-8') as stdin_file:
        result = subprocess.run(cmd, stdin=stdin_file, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr


def run_mysql_command(sql: str):
    cmd = [
        'mysql',
        f'-h{MYSQL_HOST}',
        f'-u{MYSQL_USER}',
        f'-p{MYSQL_PASSWORD}',
        '--batch',
        '--skip-column-names',
        '--default-character-set=utf8mb4'
    ]
    result = subprocess.run(cmd, input=sql, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr


def prepare_database():
    sql = f"DROP DATABASE IF EXISTS {DATABASE}; CREATE DATABASE {DATABASE};"
    rc, _, stderr = run_mysql_command(sql)
    if rc != 0:
        raise RuntimeError(f'Failed to prepare database: {stderr.strip()}')


def compare_output(actual: str, expected_path: Path):
    expected = expected_path.read_text(encoding='utf-8')
    return actual.strip() == expected.strip(), actual, expected


def update_progress(progress_path: Path, module_name: str, status: str):
    progress = {'scores': {}}
    if progress_path.exists():
        try:
            progress = json.loads(progress_path.read_text(encoding='utf-8'))
        except json.JSONDecodeError:
            progress = {'scores': {}}

    progress.setdefault('scores', {})
    progress['scores'][module_name] = {
        'status': status,
        'checked_at': datetime.utcnow().isoformat() + 'Z'
    }
    progress_path.write_text(json.dumps(progress, indent=2) + '\n', encoding='utf-8')


def grade_module(module_dir: Path):
    summary = []
    status = 'PASS'
    if not module_dir.exists():
        return 'FAIL', [f'Module directory not found: {module_dir.name}']

    assignment_sql = module_dir / 'assignment.sql'
    tests_sql = module_dir / 'tests.sql'
    expected_output = module_dir / 'expected_output.txt'
    setup_sql = module_dir / 'setup.sql'

    if not assignment_sql.exists() or not tests_sql.exists() or not expected_output.exists():
        return 'FAIL', [f'Missing assignment, tests, or expected output in {module_dir.name}']

    prepare_database()

    if setup_sql.exists():
        rc, _, stderr = run_mysql_script(setup_sql)
        if rc != 0:
            return 'FAIL', [f'Setup execution failed for {module_dir.name}: {stderr.strip()}']

    rc, _, stderr = run_mysql_script(assignment_sql)
    if rc != 0:
        return 'FAIL', [f'Assignment execution failed for {module_dir.name}: {stderr.strip()}']

    rc, stdout, stderr = run_mysql_script(tests_sql)
    if rc != 0:
        return 'FAIL', [f'Test execution failed for {module_dir.name}: {stderr.strip()}']

    passed, actual, expected = compare_output(stdout, expected_output)
    if not passed:
        status = 'FAIL'
        summary.append(f'{module_dir.name}: FAIL')
        summary.append('--- actual ---')
        summary.append(actual.strip())
        summary.append('--- expected ---')
        summary.append(expected.strip())
    else:
        summary.append(f'{module_dir.name}: PASS')

    return status, summary


def main():
    parser = argparse.ArgumentParser(description='Autograde SQL module directories.')
    parser.add_argument('--modules', required=True, help='Comma-separated module directories to grade')
    parser.add_argument('--comment-file', required=True, type=Path, help='Write the PR comment summary to this file')
    parser.add_argument('--progress-file', type=Path, help='Optional JSON file to update grading progress')
    args = parser.parse_args()

    modules = [m.strip() for m in args.modules.split(',') if m.strip()]
    if not modules:
        raise SystemExit('No modules provided to grade.')

    overall = ['# Autograde Summary']
    failed = False

    for module_name in modules:
        module_dir = Path(module_name)
        status, lines = grade_module(module_dir)
        overall.extend(lines)
        if args.progress_file:
            update_progress(args.progress_file, module_name, status)
        if status != 'PASS':
            failed = True

    overall.append('')
    overall.append(f'Result: {"FAIL" if failed else "PASS"}')
    args.comment_file.write_text('\n'.join(overall) + '\n', encoding='utf-8')
    raise SystemExit(1 if failed else 0)


if __name__ == '__main__':
    main()
