# SQL Essentials for the Real World Microcourse

## Professional SQL Training with Practical Implementation

This repository delivers a complete SQL training curriculum for developers, analysts, and database engineers who need real-world MySQL skills.

The course is organized as a structured, project-driven learning path through core SQL concepts, database administration, and application-ready stored programming techniques.

## What this repository contains

- `docs/` – Course orientation, objectives, instructor support, and learning guidance
- `modules/` – Sixteen modules with instructional material, practice examples, quizzes, reflections, and submission artifacts
- `final_project/` – Capstone project files with database creation, schema changes, and reporting queries
- `fllc-security-labs/` – SQL security, forensic, compliance, and anomaly detection labs
- `fllc-cheatsheets/` – Practical SQL security and compliance cheat sheets
- `chapter0/`, `chapter1/` – Supporting chapter resources for the course structure
- `.github/workflows/` – Repository automation workflows
- `.devcontainer/` – Development container configuration for reproducible environments

## Audience and outcomes

This course is designed for:
- developers preparing for database engineering or backend roles
- analysts who need advanced SQL query and reporting skills
- IT professionals who must secure, maintain, and automate MySQL databases

By the end of this course, learners will be able to:
- design normalized relational schemas and enforce referential integrity
- write production-grade SQL queries using joins, aggregations, subqueries, and window functions
- implement transactions, stored procedures, functions, triggers, and scheduled events in MySQL
- manage users, privileges, backups, and recovery for operational database systems
- build audit-capable workloads and apply database security best practices

## Repository structure

### Modules
Each module folder contains:
- `InstructionalMaterial.md` – teaching content and real-world examples
- `Examples.md` – hands-on SQL snippets demonstrating the module topic
- `Assignment.md` – graded tasks and expectations
- `Quiz.md` – knowledge checks and review questions
- `Reflections.md` – learning reflection prompts
- `moduleXX_*.sql` / `moduleXX_notes.txt` – submission artifacts for practical work

### Final project
The `final_project/` folder contains a full database implementation with:
- schema creation and sample data
- schema maintenance via ALTER scripts
- reporting queries for download tracking and analytics

### Security labs and cheatsheets
The `fllc-security-labs/` content extends the curriculum with security-focused SQL use cases:
- injection and defensive coding
- forensic and compliance queries
- AI-assisted anomaly detection patterns

## How to use this repository

1. Clone the repository and open it in a compatible editor.
2. Review the `docs/Welcome.md` and `docs/Orientation.md` pages.
3. Work through chapters in numerical order from `chapter1/module01` through `chapter16/module16`.
4. Execute the SQL files in the `moduleXX` folders against a MySQL test instance.
5. Complete the final project after finishing the core modules.

## Recommended workflow

- Use MySQL Workbench, MySQL Shell, or a compatible local MySQL server
- Run each module's sample and submission scripts in an isolated development schema
- Capture output or screenshots where required, and keep notes in the module folder
- Use the built-in notes files to document completion and observations

## Notes for reviewers

This repository has been standardized to match the intended course folder layout shown in the reference image. The content includes module-level submission files and clean course navigation, with broken external references replaced by internal repository guidance.

---

## License and disclaimer

For educational use only. This material is not intended as a commercially licensed product.
