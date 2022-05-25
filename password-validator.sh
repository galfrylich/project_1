#!/bin/bash    


RED='\033[0;31m' # colors for user output
GREEN='\033[0;32m'

check_pass(){
    argument=$1 # get first argument 
    len="${#argument}" # get length of argument 
    if [[ $len -ge 10 ]]
    then
        if [[$argument =~ [[:digit:]] ]]; then 
            if [[ "$argument" =~ [[:upper:]] ]] && [[ "$argument" =~ [[:lower:]] ]]; then 
                    echo -e "${GREEN}password is good"
                    exit 0
                    
            else 
                    echo -e "${RED}password must include both the small and capital case letters."
                    exit 1
                fi        
        else 
            echo -e "${RED}password must contain digits" 
            exit 1
        fi       
    else
    echo -e "${RED}password must contain minimum of 10 characters"
    exit 1
    fi
}

while getopts "f" options; do # getopts for -f flag 
    case "${options}" in         
        f)                    
        read -r firstline<$2 # read from file 
        check_pass $firstline; # execute check password
        ;;
    esac
done


check_pass $1 # if no flag go to function with first argument


