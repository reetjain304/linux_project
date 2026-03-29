#!/bin/bash
# =============================================================================
# Script 4: Log File Analyzer
# Author: REET JAIN | Reg: 24BCE11435
# Course: Open Source Software | Slot: A24
# Description: Reads a log file line by line, counts keyword occurrences,
#              and prints a summary with the last 5 matching lines.
# Usage: bash script4_log_analyzer.sh [logfile] [keyword]
# Example: bash script4_log_analyzer.sh /var/log/syslog error
# =============================================================================

# --- Accept command-line arguments ---
# $1 = log file path (optional — defaults to /var/log/syslog)
# $2 = keyword to search for (optional — defaults to "error")
LOGFILE="${1:-/var/log/syslog}"
KEYWORD="${2:-error}"

# --- Counter variable ---
COUNT=0
TOTAL_LINES=0

echo "============================================================"
echo "              LOG FILE ANALYZER                             "
echo "============================================================"
echo ""
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive)"
echo ""

# --- Validate that the log file exists and is readable ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [ERROR] File not found: $LOGFILE"
    echo ""
    echo "  Try one of these available log files:"
    # List common log files that exist on this system
    for f in /var/log/syslog /var/log/auth.log /var/log/kern.log /var/log/dpkg.log; do
        if [ -f "$f" ]; then
            echo "    $f"
        fi
    done
    echo ""
    echo "  Usage: bash script4_log_analyzer.sh <logfile> [keyword]"
    exit 1
fi

# Check if file is empty
if [ ! -s "$LOGFILE" ]; then
    echo "  [WARNING] The file '$LOGFILE' exists but is empty."
    echo "  Try a different log file."
    exit 1
fi

echo "  Scanning..."
echo ""

# --- Read the file line by line using a while-read loop ---
while IFS= read -r LINE; do
    # Increment total line counter
    TOTAL_LINES=$((TOTAL_LINES + 1))

    # Check if this line contains the keyword (case-insensitive with -i flag)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"

# --- Print summary ---
echo "------------------------------------------------------------"
echo "  RESULTS"
echo "------------------------------------------------------------"
echo "  Total lines scanned : $TOTAL_LINES"
echo "  Keyword matches     : $COUNT  (keyword: '$KEYWORD')"

# Calculate percentage if total > 0
if [ "$TOTAL_LINES" -gt 0 ]; then
    # Use awk for floating point percentage
    PCT=$(awk "BEGIN {printf \"%.2f\", ($COUNT/$TOTAL_LINES)*100}")
    echo "  Match percentage    : $PCT%"
fi

echo ""

# --- Show last 5 matching lines ---
if [ "$COUNT" -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo "  LAST 5 MATCHING LINES"
    echo "------------------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r line; do
        echo "  >> $line"
    done
else
    echo "  No lines containing '$KEYWORD' were found in $LOGFILE."
    echo "  Try a different keyword, e.g.: warn, fail, denied, started"
fi

echo ""
echo "============================================================"
echo "  End of Log File Analyzer"
echo "============================================================"
