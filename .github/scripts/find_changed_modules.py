#!/usr/bin/env python3
import os
import re
import subprocess

MODULE_PATTERN = re.compile(r'^(module-\d+(?:-[^/]+)?)(?:/|$)')


def git_diff_files():
    base_ref = os.environ.get('GITHUB_BASE_REF')
    head_sha = os.environ.get('GITHUB_SHA')

    if base_ref and head_sha:
        subprocess.run(['git', 'fetch', '--no-tags', 'origin', base_ref], check=True)
        diff_range = f'origin/{base_ref}...{head_sha}'
    else:
        diff_range = 'HEAD^..HEAD'

    output = subprocess.check_output([
        'git', 'diff', '--name-only', '--diff-filter=ACMR', diff_range
    ], text=True)
    return output.splitlines()


def main():
    files = git_diff_files()
    modules = []
    for path in files:
        match = MODULE_PATTERN.match(path)
        if match:
            modules.append(match.group(1))
    modules = sorted(set(modules))
    if modules:
        print(','.join(modules))
    else:
        # Fall back to all module folders when no module-specific changes are detected.
        all_modules = sorted(
            p.name for p in os.scandir('.') if p.is_dir() and re.match(r'^module-\d+$', p.name)
        )
        print(','.join(all_modules))


if __name__ == '__main__':
    main()
