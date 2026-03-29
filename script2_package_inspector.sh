#!/bin/bash
# =============================================================================
# Script 2: FOSS Package Inspector
# Author: REET JAIN | Reg: 24BCE11435
# Course: Open Source Software | Slot: A24
# Description: Checks if Git is installed, shows version/licence info,
#              and prints a philosophy note using a case statement
# =============================================================================

# --- Target package for this audit ---
PACKAGE="git"

echo "============================================================"
echo "         FOSS PACKAGE INSPECTOR — $PACKAGE                 "
echo "============================================================"
echo ""

# --- Check if the package is installed using dpkg ---
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "  [OK] '$PACKAGE' is INSTALLED on this system."
    echo ""

    # --- Display version information ---
    VERSION=$(git --version 2>/dev/null)
    echo "  Version   : $VERSION"

    # --- Display licence and description from apt-cache ---
    echo ""
    echo "------------------------------------------------------------"
    echo "  PACKAGE METADATA (from apt-cache)"
    echo "------------------------------------------------------------"
    apt-cache show "$PACKAGE" 2>/dev/null | grep -E "^(Version|Maintainer|Homepage|Section):" | while IFS= read -r line; do
        echo "  $line"
    done

    # --- Show installation path ---
    echo ""
    GIT_PATH=$(which git)
    echo "  Binary location : $GIT_PATH"

    # --- Show config files if they exist ---
    echo ""
    echo "------------------------------------------------------------"
    echo "  CONFIGURATION FILES"
    echo "------------------------------------------------------------"
    if [ -f "$HOME/.gitconfig" ]; then
        echo "  User config  : $HOME/.gitconfig  [EXISTS]"
    else
        echo "  User config  : $HOME/.gitconfig  [NOT FOUND — run: git config --global user.name 'Name']"
    fi

    if [ -f "/etc/gitconfig" ]; then
        echo "  System config: /etc/gitconfig    [EXISTS]"
    else
        echo "  System config: /etc/gitconfig    [NOT FOUND]"
    fi

else
    # --- Package not installed branch ---
    echo "  [!!] '$PACKAGE' is NOT installed on this system."
    echo ""
    echo "  To install, run:"
    echo "    sudo apt update && sudo apt install git -y"
    echo ""
    exit 1
fi

# --- Philosophy note using case statement ---
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "------------------------------------------------------------"

case $PACKAGE in
    git)
        echo "  Git: Linus Torvalds built this in 10 days in 2005 after"
        echo "  BitKeeper — a proprietary tool — revoked free access to"
        echo "  the Linux kernel team. Git is now the version control"
        echo "  backbone of over 100 million developers on GitHub alone."
        echo "  Licence: GPL v2 — copyleft, freedom-preserving."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Powers roughly 30% of all websites globally."
        echo "  Licence: Apache 2.0 — permissive."
        ;;
    mysql|mariadb)
        echo "  MySQL: Open source at the heart of millions of web apps."
        echo "  The 'M' in the LAMP stack."
        echo "  Licence: GPL v2 / Commercial dual-model."
        ;;
    vlc)
        echo "  VLC: Students in Paris built the media player the world"
        echo "  needed. Plays anything, asks nothing."
        echo "  Licence: LGPL / GPL."
        ;;
    python3|python)
        echo "  Python: A language shaped entirely by community consensus."
        echo "  The PSF licence is one of the most permissive around."
        ;;
    *)
        echo "  '$PACKAGE' is an open-source tool. Its source code is"
        echo "  freely available, auditable, and modifiable."
        ;;
esac

echo ""
echo "============================================================"
echo "  End of FOSS Package Inspector"
echo "============================================================"
