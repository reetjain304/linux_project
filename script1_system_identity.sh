#!/bin/bash
# =============================================================================
# Script 1: System Identity Report
# Author: REET JAIN | Reg: 24BCE11435
# Course: Open Source Software | Slot: A24
# Description: Displays a welcome-screen style summary of the Linux system
# =============================================================================

# --- Variables ---
STUDENT_NAME="REET JAIN"
REG_NO="24BCE11435"
SOFTWARE_CHOICE="Git"
SOFTWARE_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                              # Kernel version
ARCH=$(uname -m)                                # System architecture
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2)  # Distribution name
USER_NAME=$(whoami)                             # Current logged-in user
HOME_DIR=$HOME                                  # Home directory path
HOSTNAME=$(hostname)                            # Machine hostname
UPTIME=$(uptime -p)                             # Human-readable uptime
DATETIME=$(date "+%A, %d %B %Y  %H:%M:%S")     # Formatted date and time
OS_LICENSE="GNU General Public License v2 (GPL v2)"  # Linux kernel licence

# --- Display the identity report ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT         "
echo "============================================================"
echo ""
echo "  Student  : $STUDENT_NAME ($REG_NO)"
echo "  Software : $SOFTWARE_CHOICE | Licence: $SOFTWARE_LICENSE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Hostname      : $HOSTNAME"
echo "  Distribution  : $DISTRO"
echo "  Kernel        : $KERNEL"
echo "  Architecture  : $ARCH"
echo "  Logged in as  : $USER_NAME"
echo "  Home Directory: $HOME_DIR"
echo "  Uptime        : $UPTIME"
echo "  Date & Time   : $DATETIME"
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE LICENCE"
echo "------------------------------------------------------------"
echo "  The Linux OS kernel is licensed under:"
echo "  $OS_LICENSE"
echo "  Source: https://www.kernel.org/doc/html/latest/process/license-rules.html"
echo ""
echo "============================================================"
echo "  End of System Identity Report"
echo "============================================================"
