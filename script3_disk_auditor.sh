#!/bin/bash
# =============================================================================
# Script 3: Disk and Permission Auditor
# Author: REET JAIN | Reg: 24BCE11435
# Course: Open Source Software | Slot: A24
# Description: Loops through key system directories and reports permissions,
#              owner, group, and disk usage. Also audits Git config files.
# =============================================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share" "/var")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR                        "
echo "============================================================"
echo ""
echo "  Auditing key system directories..."
echo ""
printf "  %-20s %-20s %-10s %s\n" "DIRECTORY" "PERMISSIONS/OWNER" "SIZE" "STATUS"
echo "  --------------------------------------------------------------------"

# --- Loop through each directory using a for loop ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get human-readable disk usage; suppress errors for restricted dirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Handle case where du returns nothing (permission denied)
        if [ -z "$SIZE" ]; then
            SIZE="N/A"
        fi

        printf "  %-20s %-20s %-10s %s\n" "$DIR" "$PERMS ($OWNER:$GROUP)" "$SIZE" "[OK]"
    else
        # Directory does not exist on this system
        printf "  %-20s %-20s %-10s %s\n" "$DIR" "---" "---" "[NOT FOUND]"
    fi
done

# --- Git-specific config file audit ---
echo ""
echo "------------------------------------------------------------"
echo "  GIT CONFIGURATION AUDIT (Chosen Software: Git)"
echo "------------------------------------------------------------"

# Check user-level git config
if [ -f "$HOME/.gitconfig" ]; then
    PERMS=$(ls -lh "$HOME/.gitconfig" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$HOME/.gitconfig" | cut -f1)
    echo "  ~/.gitconfig         : Found | $PERMS | Size: $SIZE"
    echo ""
    echo "  Contents:"
    # Display gitconfig content with indentation
    while IFS= read -r line; do
        echo "    $line"
    done < "$HOME/.gitconfig"
else
    echo "  ~/.gitconfig         : NOT FOUND"
    echo "  Run: git config --global user.name 'Devang Srivastava'"
    echo "       git config --global user.email 'your@email.com'"
fi

echo ""

# Check system-level git config
if [ -f "/etc/gitconfig" ]; then
    PERMS=$(ls -lh /etc/gitconfig | awk '{print $1, $3, $4}')
    echo "  /etc/gitconfig       : Found | $PERMS"
else
    echo "  /etc/gitconfig       : NOT FOUND (normal if no system-wide config set)"
fi

# Check git binary location and permissions
if command -v git &>/dev/null; then
    GIT_BIN=$(which git)
    GIT_PERMS=$(ls -lh "$GIT_BIN" | awk '{print $1, $3, $4}')
    echo "  Git binary           : $GIT_BIN | $GIT_PERMS"
fi

echo ""
echo "============================================================"
echo "  End of Disk and Permission Auditor"
echo "============================================================"
