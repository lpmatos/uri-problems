#!/bin/bash

############################################
#### Verify File                        ####
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

GLOBAL_FILE=

# =============================================================================
# TRAPS - SIGNALS
# =============================================================================

trap SignalStatusZero ${SUCESS}
trap SignalStatusSIGINT SIGINT

# =============================================================================
# FUNCTIONS
# =============================================================================

function SignalStatusSIGINT {
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
    if [ $? -eq $SUCESS ]
    then
        # DISPLAYING A MESSAGE- IF EVERYTHING WORKS
        echo -e "\n${NC}Command executed with ${GREEN}success!"
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

function Help() {
    # CALL FUNCTION PROGRAM NAME
    ProgramName
    # DISPLAYING A MESSAGE
    echo
    echo -e "${YELLOW}Running: ${NC}./verify.sh [option]\n"
    echo -e "${NC}Options:\n"
    echo -e "${NC}-h             ${GREEN}Help."
    echo -e "${NC}-f             ${GREEN}File."
    # SCRIPT EXIT
    exit 1
}

# =============================================================================

function CheckEscolha(){
    # DECLARING A LOCAL VARIABLE CATCHING THE FIRST ARGUMENT
    local ESCOLHA=${1}
    # CHECKING
    if [ -z ${ESCOLHA} ]
    then
        # DISPLAYING A MESSAGE - IF WRONG
        echo -e "\n${RED}The choice is null. An option needs to be passed...\n"
        # ABORT EXCEPTION
        Abort
    else
        # DISPLAYING A MESSAGE- IF EVERYTHING WORKS
        echo -e "\n${YELLOW}The choice is: ${NC}${ESCOLHA}"
    fi
}

# =============================================================================

function Main(){
    local FILE=${1}
    CheckEscolha ${FILE}
    if [ -e "${FILE}" ] ; then
        echo -e "\nThe file exists..."
        EXPORT=$(cat -n ${FILE})
        if [ "${EXPORT}" == "" ]; then
            echo -e "\n${RED}Empty file...\n"
            Abort
        else
            echo -e "\nContent Filled..."
            cat -n ${FILE}
        fi
    else
        echo -e "\n${RED}The file does not exist...\n"
        Abort
    fi
}

# =============================================================================
# OPTIONS
# =============================================================================

# IF NO ARGS IN EXECUTION, CALL FUNCTION HELP
if [ -z ${1} ]
then
    Help
else
    # IF WE HAVE ARGUMENTS...
    while test $# -gt 0; do
           case "${1}" in
                -h)
                    shift
                    Help
                    exit
                    shift
                    ;;
                -f)
                    shift
                    GLOBAL_FILE=${1}
                    shift
                    ;;
                *)
                   echo -e "\n${RED}Invalid or missing argument option:${NC}" ${OP}
                   echo -e "\n${YELLOW}Type ${GREEN}'${0}' ${YELLOW}-h for more help."
                   exit 1 ;;
          esac
    done
fi

# =============================================================================
# CALL FUNCTIONS
# =============================================================================

# MAIN

Main "${GLOBAL_FILE}"

# VERIFY

Verify
