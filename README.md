# SQL Essentials for the Real World Microcourse

**Author:** Personfu

## Course Overview

This course is a comprehensive, professional, and hands-on journey through SQL and relational database management, designed to take you from foundational concepts to advanced, real-world skills. Inspired by the best of CompTIA, LabSim, and TestOut, this course features:

- Fully annotated SQL scripts and real-world scenarios
- Step-by-step labs, assignments, and quizzes
- Instructor notes and advanced tips
- Accessibility, support, and guidance throughout

## Course Structure

- **docs/**: Orientation, support, FAQs, textbook reference, and general course info
- **modules/**: 16 modules, each with instructional material, assignments, quizzes, and examples
- **scripts/**: All SQL scripts, organized by chapter and type
- **diagrams/**: Database diagrams and models
- **appendices/**: Installation guides, accessibility, and extra resources
- **instructor/**: Notes, answer keys, and advanced content
- **module-00-getting-started/**: Orientation starter assignment and grading scaffold
- **module-01/** through **module-16/**: Module-level assignments with hidden autograder tests

## Autograding Support
- **.github/workflows/autograde.yml**: PR-based autograder workflow
- **.github/scripts/find_changed_modules.py**: detects changed modules in the PR
- **.github/scripts/autograde.py**: runs MySQL tests and posts PR feedback
- **progress.json**: module progress status for each PR run

## How grading works
1. A PR that modifies one or more `module-XX/` directories triggers the workflow.
2. The workflow spins up a MySQL 8 service container and waits for it to become ready.
3. The changed module folders are detected and graded only.
4. Each module runs on a fresh `autograde` database and compares hidden test output against `expected_output.txt`.
5. The workflow posts a sticky comment with pass/fail details and updates `progress.json`.

## Getting Started
- See docs/Welcome.md for your first steps
- All modules are self-contained and build on each other
- Assignments and quizzes are designed for real-world mastery

---

© 2026 Personfu. All rights reserved. For educational use only.