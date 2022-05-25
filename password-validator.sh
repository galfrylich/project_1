#!/bin/bash    


RED='\033[0;31m'
GREEN='\033[0;32m'

check_pass(){
    argument=$1
    len="${#argument}"
    if [[ $len -ge 10 ]]
    then
        if [[ $argument =~ [[:alpha:]] && $argument =~ [[:digit:]] ]]; then 
            if [[ "$argument" =~ [[:upper:]] ]] && [[ "$argument" =~ [[:lower:]] ]]; then 
                    echo -e "${GREEN}password is good"
                    exit 0
                    
            else 
                    echo -e "${RED}password must include both the small and capital case letters."
                    exit 1
                fi        
        else 
            echo -e "${RED}password must Contain both alphabet and number" 
            exit 1
        fi       
    else
    echo -e "${RED}password must contain minimum of 10 characters"
    exit 1
    fi
}

while getopts "f" options; do
    case "${options}" in         
        f)                    
        read -r firstline<$2
        check_pass $firstline;
        ;;
    esac
done


check_pass $1


