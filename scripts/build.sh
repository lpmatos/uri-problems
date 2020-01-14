#!/bin/bash

############################################
#### Automating Docker Image Build      ####
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

CI_REGISTRY_PASSWORD=${CI_BUILD_TOKEN}

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
    echo >&2 '
    ***************
    *** ABORTED ***
    ***************
    '
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
    echo -e "\n${CYAN}Script $PROGNAME: ${YELLOW} By Cloud Team."
}

# =============================================================================

function CheckImageTag(){
    # CHECKING IMAGE TAG
    if [ -z ${BUILD_IMAGE_TAG} ] || [ -z ${BUILD_IMAGE_TAG_HASH} ]
    then
        # DISPLAYING A MESSAGE - IF WRONG
        echo -e "\n${RED}Error - ${NC}The image tag must be passed...\n"
        # ABORT EXCEPTION
        Abort
    fi
}

# =============================================================================

function CheckImageTagLatest(){
    # CHECKING IMAGE TAG LATEST
    if [ -z ${BUILD_IMAGE_TAG_LATEST} ]
    then
        # DISPLAYING A MESSAGE - IF WRONG
        echo -e "\n${RED}Error - ${NC}The image tag latest must be passed...\n"
        # ABORT EXCEPTION
        Abort
    fi
}

# =============================================================================

function RegistryCredentials(){
    # DISPLAY A MESSAGE
    echo -e "\n${NC}Checking registry credentials..."
    # CHECKING ENVS USED TO LOGIN IN THE REGISTRY
    [[ -n "${CI_REGISTRY_USER}" ]] && [[ -n "${CI_REGISTRY_PASSWORD}" ]] && return ${SUCESS}
    # ABORT EXCEPTION
    Abort
}

# =============================================================================

function Login(){
    # DISPLAY A MESSAGE
    echo -e "\n${NC}Logging into the registry..."
    # CHECKING REGISTRY CREDENTIALS
    RegistryCredentials || return ${SUCESS}
    # DOCKER LOGIN IN REGISTRY
    docker login --username ${CI_REGISTRY_USER} --password ${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}
}

# =============================================================================

function Logout(){
    # DISPLAY A MESSAGE
    echo -e "\n${NC}Logging out of registry..."
    # DOCKER LOGOUT REGISTRY
    docker logout ${CI_REGISTRY}
}

# =============================================================================

function Pull(){
    # DISPLAY A MESSAGE
    echo -e "\n${NC}Pulling base image..."
    # CHECKING REGISTRY CREDENTIALS
    RegistryCredentials || return ${SUCESS}
    # DOCKER PULL IMAGE DOCKER REGISTRY
    docker pull ${BUILD_IMAGE_TAG_HASH} || echo "The image ${BUILD_IMAGE_TAG_HASH} is not available. Will not use cache."
}

# =============================================================================

function Push(){
    # CHECKING REGISTRY CREDENTIALS
    RegistryCredentials || return ${SUCESS}
    # GETTING VALUE OF JOB NAME
    local JOB=$(echo ${CI_JOB_NAME} | grep "master")
    # CHECKING MASTER BRANCH
    if [ ${JOB} ]
    then
        # CALL CHECKING IMAGE TAG LATEST
        CheckImageTagLatest
        # DISPLAY A MESSAGE
        echo -e "\n${NC}Push the docker image to docker registry - Hash, Branch and Latest..."
        # DOCKER PUSH WITH TAG BRANCH
        docker push ${BUILD_IMAGE_TAG_HASH}
        # DOCKER PUSH WITH LATEST
        docker push ${BUILD_IMAGE_TAG_LATEST}
        # DOCKER PUSH WITH TAG BRANCH
        docker push ${BUILD_IMAGE_TAG}
    else
        # DISPLAY A MESSAGE
        echo -e "\n${NC}Push the docker image to docker registry - Hash and Branch..."
        # DOCKER PUSH WITH TAG COMMIT HASH
        docker push ${BUILD_IMAGE_TAG_HASH}
        # DOCKER PUSH WITH TAG BRANCH
        docker push ${BUILD_IMAGE_TAG}
    fi
}

# =============================================================================

function Build(){
    # DISPLAY A MESSAGE
    echo -e "\n${NC}Building image: ${BUILD_IMAGE_TAG_HASH}..."
    # BUILD THE DOCKER IMAGE
    docker build --cache-from "${BUILD_IMAGE_TAG_HASH}" --build-arg BRANCH=${BRANCH} -t "${BUILD_IMAGE_TAG_HASH}" -f "${BUILD_DOCKERFILE}" "${BUILD_CONTEXT}"
    # GETTING VALUE OF JOB NAME
    local JOB=$(echo ${CI_JOB_NAME} | grep "master")
    # CHECKING MASTER BRANCH
    if [ ${JOB} ]
    then
        # CALL CHECKING IMAGE TAG LATEST
        CheckImageTagLatest
        # DISPAY A MESSAGE
        echo -e "\nCreate the Docker Tag Latest..."
        # CREATE THE DOCKER TAG LATEST TO THE IMAGE
        docker tag "${BUILD_IMAGE_TAG_HASH}" "${BUILD_IMAGE_TAG_LATEST}"
        # CREATE THE DOCKER TAG BRANCH TO THE IMAGE
        docker tag "${BUILD_IMAGE_TAG_HASH}" "${BUILD_IMAGE_TAG}"
    else
        # DISPAY A MESSAGE
        echo -e "\nCreate the Docker Tag Branch..."
        # CREATE THE DOCKER TAGS TO THE IMAGE
        docker tag "${BUILD_IMAGE_TAG_HASH}" "${BUILD_IMAGE_TAG}"
    fi
}

# =============================================================================

function Main(){
    # CALL PROGRAM NAME
    ProgramName
    # CALL CHECKING IMAGE TAG
    CheckImageTag
    # DOCKER LOGIN INTO THE REGISTRY
    Login
    # DOCKER PULL THE IMAGE
    Pull
    # DOCKER BUILD THE IMAGE
    Build
    # DOCKER PUSH IMAGE WITH TAG
    Push
    # DOCKER LOGOUT REGISTRY
    Logout
}

# =============================================================================
# CALL FUNCTIONS
# =============================================================================

# MAIN

Main

# VERIFY

Verify
