# oss-audit

> **Open Source Software — Capstone Project (OSS NGMC)**
> VITyarthi Portal Submission

---

## Student Details

| Field | Details |
|---|---|
| **Student Name** | REET JAIN |
| **Registration Number** | [24BCE11435 |
| **Slot** | A24 |
| **Chosen Software** | Git (Version Control · GPL v2) |
| **Date of Submission** | 30 03 2026 |

---

## About This Project

This repository contains the five shell scripts submitted as part of the Open Source Software capstone audit. The chosen software is **Git** — a distributed version control system built by Linus Torvalds in 2005 and licensed under GPL v2.

The full written report (PDF) is submitted separately on the VITyarthi portal.

---

## Repository Structure

```
oss-audit/
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---

## Script Descriptions

### Script 1 — System Identity Report (`script1_system_identity.sh`)
Displays a welcome-screen style report of the current Linux system. Shows the distribution name, kernel version, logged-in user, home directory, uptime, date/time, and a message about the GPL v2 license that covers the OS.

**Shell concepts used:** variables, `echo`, command substitution `$()`, basic output formatting.

---

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)
Checks whether Git is installed on the system, retrieves its version and license metadata using `dpkg`, and uses a `case` statement to print a one-line philosophy note based on the package name.

**Shell concepts used:** `if-then-else`, `case` statement, `dpkg -l` / `dpkg -s`, pipe with `grep`, `awk`.

---

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports each directory's disk usage and permission/ownership string. Also checks for the presence of Git's `~/.gitconfig` file.

**Shell concepts used:** `for` loop, arrays, `du`, `ls -ld`, `awk`, `cut`, conditional directory check `[ -d ]`.

---

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)
Reads a log file line by line, counts occurrences of a keyword (default: `error`), and prints the last 5 matching lines. Accepts the log file path and keyword as command-line arguments.

**Shell concepts used:** `while read` loop, `if-then`, counter variables, arithmetic expansion `$(( ))`, command-line arguments `$1` / `$2`, parameter default `${var:-default}`.

---

### Script 5 — Open Source Manifesto Generator (`script5_manifesto_generator.sh`)
Interactively asks the user three questions, then generates a personalised open-source philosophy statement and saves it to a `.txt` file named after the current user. Demonstrates the `alias` concept in comments.

**Shell concepts used:** `read -p` for interactive input, string concatenation, file output with `>` and `>>`, `date` command, `cat` to display output, alias concept.

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Debian, or WSL on Windows)
- Bash shell (pre-installed on all the above)
- Git installed: `sudo apt update && sudo apt install git`

### Setup

Clone the repository and make all scripts executable:

```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
chmod +x *.sh
```

### Running Each Script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_auditor.sh
```

**Script 4 — Log File Analyzer**
```bash
# Basic usage (searches for 'error' by default)
./script4_log_analyzer.sh /var/log/syslog

# With a custom keyword
./script4_log_analyzer.sh /var/log/syslog warning
```

**Script 5 — Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Follow the interactive prompts
# Output saved to: manifesto_<yourusername>.txt
```

---

## Dependencies

| Script | Dependencies | Install Command |
|---|---|---|
| All scripts | Bash ≥ 4.0 | Pre-installed |
| Script 2 | `dpkg` (Debian/Ubuntu) | Pre-installed on WSL |
| Script 3 | `du`, `ls` | Pre-installed (GNU coreutils) |
| Script 4 | `grep`, `tail` | Pre-installed |
| Script 5 | `date`, `cat` | Pre-installed |

All dependencies come pre-installed on Ubuntu/WSL. No additional packages are required.

---

## License

This project is submitted for academic evaluation under VIT's Open Source Software course. The shell scripts are original work by the student named above.

The software audited — **Git** — is licensed under the **GNU General Public License v2 (GPL v2)**. Full license text: [https://www.gnu.org/licenses/old-licenses/gpl-2.0.html](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)# linux_project
