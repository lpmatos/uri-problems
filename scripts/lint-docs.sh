#!/bin/bash

############################################
#### Lint Docs and CHANGELOG file       ####
############################################

set -eo pipefail

# =============================================================================
# OUTPUT-COLORING
# =============================================================================

BLACK="\033[0;90m"       # Black
RED="\033[0;91m"         # Red
GREEN="\033[0;92m"       # Green
YELLOW="\033[0;93m"      # Yellow
BLUE="\033[0;94m"        # Blue
PURPLE="\033[0;95m"      # Purple
CYAN="\033[0;96m"        # Cyan
NC="\033[0;97m"          # White

# =============================================================================
# CONSTANTS
# =============================================================================

SUCESS=0
BAD=1

# =============================================================================

cd "$(dirname "${0}")/.."
echo "=> Linting documents at path $(pwd) as $(whoami)..."

# Ensure that the CHANGELOG.md does not contain duplicate versions

DUPLICATE_CHANGELOG_VERSIONS=$(grep --extended-regexp '^## .+' CHANGELOG.md | sed -E 's| \(.+\)||' | sort -r | uniq -d)

# =============================================================================
# TRAPS - SIGNALS
# =============================================================================

trap SignalStatusZero ${SUCESS}
trap SignalStatusInt SIGINT

# =============================================================================
# FUNCTIONS
# =============================================================================

function SignalStatusInt {
    # DISPLAYING A MESSAGE
    echo -e "${RED}I received a CTRL + C. ${NC}..."
}

# =============================================================================

function SignalStatusZero {
    # DECLARING A LOCAL VARIABLE CATCHING THE SCRIPT NAME
    local PROGNAME=$(basename ${0})
    # DISPLAYING A MESSAGE
    echo -e "${NC}\nThe script ${PROGNAME} was executed with ${GREEN}success!)"
}

# =============================================================================

function Abort(){
    # DISPLAYING A MESSAGE - ERROR
    echo >&2 "
    ***************
    *** ABORTED ***
    ***************
    "
    # DISPLAYING A MESSAGE - ERROR
    echo "An error has occurred. Going out..." >&2
    # SCRIPT EXIT
    exit ${BAD}
}

# =============================================================================

function Verify(){
    # CHECKING OUT
    if [ $? -eq ${SUCESS} ]
    then
        # DISPLAYING A MESSAGE- IF EVERYTHING WORKS
        echo -e "\n${NC}Command executed with ${GREEN}success!"
        exit ${SUCESS}
    else
        # DISPLAYING A MESSAGE - IF WRONG
        echo -e "\n${NC}Return Status Not Expected - ${RED}Verify..."
        # ABORT EXCEPTION
        Abort
    fi
}

# =============================================================================

function ProgramName(){
    # DECLARING A LOCAL VARIABLE CATCHING THE SCRIPT NAME
    local PROGNAME=$(basename ${0})
    # DISPLAYING A MESSAGE
    echo -e "\n${CYAN}Script $PROGNAME:${YELLOW} By Cloud Team."
}

# =============================================================================

function Changelog(){
    # DISPLAYING A MESSAGE
    echo -e "\n=> Checking for CHANGELOG.md duplicate entries..."
    # CHECKING CHANGELOG REGEX TO DUPLICATE TAGS
    if [ "${DUPLICATE_CHANGELOG_VERSIONS}" != "" ]
    then
        # DISPLAYING A MESSAGE
        echo "✖ ERROR: Duplicate versions in CHANGELOG.md..." >&2
        # DISPLAYING A MESSAGE
        echo "${DUPLICATE_CHANGELOG_VERSIONS}" >&2
        # ABORT EXCEPTION
        Abort
    fi
}

# =============================================================================

function Docs(){
    # MAKE SURE NO FILES IN DOCS/ ARE EXECUTABLE
    local EXEC_PERM_COUNT=$(find docs/ -type f -perm 755 | wc -l)
    # DISPLAYING A MESSAGE
    echo -e "\n=> Checking $(pwd)/docs for executable permissions..."
    # CHECKING DOCS
    if [ "${EXEC_PERM_COUNT}" -ne 0 ]
    then
        # DISPLAYING A MESSAGE
        echo "✖ ERROR: Executable permissions should not be used in documentation! Use `chmod 644` to the files in question..." >&2
        # FIND
        find docs/ -type f -perm 755
        # ABORT EXCEPTION
        Abort
    fi
}

# =============================================================================

function Main(){
    # PROGRAM NAME FUNCTION
    ProgramName
    # CHECKING CHANGELOG
    Changelog
    # CHECKING DOCS
    Docs
}

# =============================================================================
# CALL FUNCTIONS
# =============================================================================

# MAIN

Main

# VERIFY

Verify
