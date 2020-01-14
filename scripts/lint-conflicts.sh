#!/bin/bash

############################################
#### Lint Conflicts after make a Merge  ####
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

CONFLICTS=$(git ls-files -u | wc -l)

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

function MergeConflicts(){
    # CHECKING CONFLICTS
    if [ "${CONFLICTS}" -gt 0 ] ; then
        # DISPLAYING A MESSAGE
        echo -e "\nThere is a merge conflict..."
        # ABORT EXCEPTION
        Abort
    else
        # DISPLAYING A MESSAGE
        echo -e "\nEverything is okay..."
    fi
}

# =============================================================================

function Main(){
    # PROGRAM NAME FUNCTION
    ProgramName
    # MERGE CONFLICT CHECKING
    MergeConflicts
}

# =============================================================================
# CALL FUNCTIONS
# =============================================================================

# MAIN

Main

# VERIFY

Verify
