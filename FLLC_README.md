# FLLC SQL Security Labs

Hands-on SQL security training alongside the Cengage SQL Essentials course material.

## Lab Structure

```
fllc-security-labs/
    01-injection/        SQL injection attack & defense lab
    02-forensics/        Incident response forensic queries
    03-hardening/        Production database hardening
fllc-cheatsheets/
    SQL_CHEATSHEET.md    Quick reference for all SQL operations
```

## Labs

| Lab | Description |
|-----|-------------|
| **Injection Lab** | 4-level progressive SQLi training: auth bypass, UNION, blind boolean, time-based |
| **Forensic Queries** | Real-world IR queries: brute force detection, privesc, exfil, injection detection |
| **Hardening** | Least-privilege roles, audit triggers, encryption, network restrictions, backup verification |

## Quick Start

1. Set up a MySQL 8.0 or PostgreSQL 15 test instance
2. Run the setup scripts in `01-injection/README.md`
3. Work through each lab level
4. Use the cheatsheet as a reference

## Course Material

The `chapter0/` and `chapter1/` directories contain the original Cengage SQL Essentials coursework. The FLLC security labs extend this with offensive and defensive security applications.

---

*FLLC 2026 — Authorized security testing only.*
