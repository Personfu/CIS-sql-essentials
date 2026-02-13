```
 ███████╗██╗     ██╗      ██████╗
 ██╔════╝██║     ██║     ██╔════╝
 █████╗  ██║     ██║     ██║
 ██╔══╝  ██║     ██║     ██║
 ██║     ███████╗███████╗╚██████╗
 ╚═╝     ╚══════╝╚══════╝ ╚═════╝
  SQL SECURITY OPERATIONS — 2026
```

<p align="center">
<img src="https://img.shields.io/badge/FLLC-SQL_Security-00FFFF?style=for-the-badge&labelColor=0D0D2B"/>
<img src="https://img.shields.io/badge/NIST-Compliant-FF00FF?style=for-the-badge&labelColor=0D0D2B"/>
<img src="https://img.shields.io/badge/SOC2-Audit-7B2FBE?style=for-the-badge&labelColor=0D0D2B"/>
<img src="https://img.shields.io/badge/AI-Detection-00FFFF?style=for-the-badge&labelColor=0D0D2B"/>
</p>

---

## Overview

SQL essentials curriculum extended with FLLC security operations labs. Covers SQL injection attack/defense, digital forensics via SQL, database hardening, compliance auditing, and AI-powered anomaly detection — all using pure SQL.

---

## FLLC Security Labs

| Lab | Directory | Description |
|-----|-----------|-------------|
| 01 | `fllc-security-labs/01-injection/` | SQL injection attack patterns, parameterized defense, WAF bypass |
| 02 | `fllc-security-labs/02-forensics/` | Forensic investigation queries — timeline reconstruction, IOC extraction |
| 03 | `fllc-security-labs/03-hardening/` | Database hardening checklist — permissions, encryption, audit config |
| 04 | `fllc-security-labs/04-compliance/` | SOC 2, PCI-DSS, NIST compliance audit queries |
| 05 | `fllc-security-labs/05-ai-detection/` | AI/ML anomaly detection patterns in pure SQL |
| 06 | `fllc-security-labs/06-privesc/` | Database privilege escalation attack/defense patterns |
| 07 | `fllc-security-labs/07-exfiltration/` | Data exfiltration techniques and real-time detection queries |

---

## FLLC Cheatsheets

| Cheatsheet | Description |
|------------|-------------|
| `fllc-cheatsheets/SQL_CHEATSHEET.md` | SQL security quick reference |
| `fllc-cheatsheets/COMPLIANCE_SQL.md` | Compliance audit queries mapped to NIST/PCI/SOC2 controls |

---

## Course Content

Original SQL essentials curriculum from the Cengage microcourse:

| Chapter | Topic |
|---------|-------|
| 0 | Setup and environment |
| 1 | SQL fundamentals, SELECT, WHERE, JOIN |

---

## Quick Start

```sql
-- Run any lab against your database:
-- PostgreSQL
psql -d yourdb -f fllc-security-labs/04-compliance/compliance_audit.sql

-- MySQL
mysql yourdb < fllc-security-labs/05-ai-detection/ai_anomaly_detection.sql

-- SQL Server
sqlcmd -d yourdb -i fllc-security-labs/04-compliance/compliance_audit.sql
```

---

## Compliance Coverage

| Framework | Controls Tested |
|-----------|----------------|
| NIST 800-53 r5 | AC-2, AC-3, AC-6, AU-2, AU-3, AU-6, IA-5, SC-13, SC-28 |
| PCI-DSS 4.0 | 2.2, 3.5, 7.1, 8.3, 10.2, 10.3, 10.6 |
| SOC 2 Type II | CC6.1, CC6.3, CC6.6, CC7.2, CC8.1 |
| CIS Controls v8 | 3.1, 4.1, 5.2, 6.7, 8.2, 16.1 |

---

**FLLC 2026** — FU PERSON by PERSON FU
