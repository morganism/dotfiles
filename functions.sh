#!/bin/bash
:<<__DEF__
Author: morgan@morganism.dev
Date  : Fri Aug  1 17:41:01 PDT 2025
__DEF__
#
#
#
#

set_colours() {
    BLA=$(eval tput setaf 0) # black
    RED=$(tput setaf 1) # red
    GRE=$(tput setaf 2) # green
    YEL=$(tput setaf 3) # yellow
    BLU=$(tput setaf 4) # blue
    MAG=$(tput setaf 5) # magenta
    CYA=$(tput setaf 6) # cyan
    WHI=$(tput setaf 7) # white
    _BLA=$(tput setab 0) # black
    _RED=$(tput setab 1) # red
    _GRE=$(tput setab 2) # green
    _YEL=$(tput setab 3) # yellow
    _BLU=$(tput setab 4) # blue
    _MAG=$(tput setab 5) # magenta
    _CYA=$(tput setab 6) # cyan
    _WHI=$(tput setab 7) # white
    RST=$(tput sgr0)     # reset
    BOL=$(tput bold)     # bold
    REV=$(tput rev)       #bold
    SMSO=$(tput smso)      #reverse
    RMSO=$(tput rmso)  
}

log() {
    echo -e "${1}"
}

debug() {
    echo -e "${REV}${1}${RST}"
}


check_packages() {
    set_colours
    PACKAGE_LIST="${PACKAGE_LIST:=}"
    if [[ -n "$@" ]]; then
        PACKAGE_LIST="$PACKAGE_LIST $@"
    else
        debug "Package  list not supplied." >&2
        exit 2
    fi

    for p in $PACKAGE_LIST
    do
        COLONS=$(echo $p | grep -c ":")
        if [[ ! "$COLONS" = "1" ]]; then
            debug "${RED}No delimiter [${SMSO}${BLA}${_WHI} : ${RMSO}] ${BLU}package$ [${SMSO}${BLA}${_WHI} ${p} ${RMSO}] . .. ... ${GRE}fixing." >&2
            PKG="$p:$p" 
        else
            PKG="$p"
        fi
        debug "${BLU}Package is$[${YEL}${PKG}]" >&2

        INSTALL=""
        #Display this:Use this with 'apt'
        DISPLAY=$(echo $PKG | awk -F: '{print $1}')
        APT_VAL=$(echo $PKG | awk -F: '{print $2}')
        if ! [ -x "$(command -v $APT_VAL)" ]; then
            debug "${BLU}apt: ${YEL}$DISPLAY${BLU} is not installed. ${GRE}added${BLU} to required" >&2
            INSTALL="$INSTALL $APT_VAL"
        fi
    done
    export PACKAGE_LIST="$INSTALL"
    debug "$PACKAGE_LIST"
}

install_packages() {
    PACKAGE_LIST="${PACKAGE_LIST:=}"
    if [[ -n "$@" ]]; then
        PACKAGE_LIST="$PACKAGE_LIST $@"
    else
        debug "${BLU}Package  list not supplied." >&2
        exit 2
    fi

    log "${BLU}Installing these packages: ${YEL}$PACKAGE_LIST" >&2
    echo -e "${RST}"
    sudo apt install -y $PACKAGE_LIST
}

install_packages_in_file() {
    PACKAGE_LIST_FILE=""
    if [[ -n "$1" ]]; then
        PACKAGE_LIST_FILE=$1
    else
        debug "Package  list file not supplied."
        exit 1
    fi

    export PACKAGE_LIST="$(cat $PACKAGE_LIST_FILE)"
    install_packages "$PACKAGE_LIST"
}
