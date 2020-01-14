#!/bin/bash

############################################
#### Automating Commits                 ####
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

GLOBAL_MESSAGE=
GLOBAL_BRANCH=

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

function Help() {
    # CALL FUNCTION PROGRAM NAME
    ProgramName
    # DISPLAYING A MESSAGE
    echo
    echo -e "${YELLOW}Running: ${NC}./commit.sh [option]\n"
    echo -e "${NC}Options:\n"
    echo -e "${NC}-h             ${GREEN}Help."
    echo -e "${NC}-m             ${GREEN}Message."
    echo -e "${NC}-b             ${GREEN}Branch."
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

function GitADD(){
    # DISPLAYING A MESSAGE
    echo -e "\n${GREEN}STEP 1: ${NC}Starting project git add...\n"
    # GIT ADD FILES
    git add -f *
}

# =============================================================================

function GitCommit(){
    # DECLARING A LOCAL VARIABLE CATCHING THE FIRST ARGUMENT
    local MESSAGE=${1}
    # CHECKING
    if [ -z ${MESSAGE} ]
    then
        # DISPLAYING A MESSAGE - IF WRONG
        echo -e "\n${RED}Error - ${NC}A message must be passed to commit...\n"
        # ABORT EXCEPTION
        Abort
    else
        # DISPLAYING A MESSAGE- IF EVERYTHING WORKS
        echo -e "\n${GREEN}STEP 2: ${NC}Starting git commit...\n"
        # GIT COMMIT WITH MESSAGE
        git commit -am "${MESSAGE}"
    fi
}

# =============================================================================

function GitPull(){
    # DECLARING A LOCAL VARIABLE CATCHING THE FIRST AND SECOND ARGUMENTS
    local ORIGIN=${1}
    local DESTINATION=${2}
    # DISPLAYING A MESSAGE
    echo -e "\n${GREEN}STEP 3: ${NC}Starting git pull...\n"
    # GIT PULL
    git pull --rebase ${ORIGIN} ${DESTINATION}
}

# =============================================================================

function GitPush(){
    # DECLARING A LOCAL VARIABLE CATCHING THE FIRST AND SECOND ARGUMENTS
    local ORIGIN=${1}
    local DESTINATION=${2}
    # DISPLAYING A MESSAGE
    echo -e "\n${GREEN}STEP 4: ${NC}Starting git push...\n"
    # GIT PUSH
    git push ${ORIGIN} ${DESTINATION}
}

# =============================================================================

function Main(){
    # DECLARING A LOCAL VARIABLE CATCHING THE FIRST AND SECOND ARGUMENTS
    local MESSAGE=${1}
    local BRANCH=${2}
    if [ -z "$(git status --porcelain)" ]
    then
        # NO CHANGES
        echo -e "\n${NC}Project directory is ${GREEN}clean...";
    else
        # CHECKING FIRST ARGUMENT
        CheckEscolha ${MESSAGE}
        # CHECKING SECOND ARGUMENT
        CheckEscolha ${BRANCH}
        # CALL GIT ADD
        GitADD
        # CALL GIT COMMIT
        GitCommit "${MESSAGE}"
        # CALL GIT PULL
        GitPull origin ${BRANCH}
        # CALL GIT PUSH
        GitPush origin ${BRANCH}
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
    while test ${#} -gt 0; do
           case "${1}" in
                -h)
                    shift
                    Help
                    exit
                    shift
                    ;;
                -m)
                    shift
                    GLOBAL_MESSAGE=${1}
                    shift
                    ;;
                -b)
                    shift
                    GLOBAL_BRANCH=${1}
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

Main "${GLOBAL_MESSAGE}" ${GLOBAL_BRANCH}

# VERIFY

Verify
