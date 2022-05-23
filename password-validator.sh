#!/bin/bash    

password=$1
len="${#password}"

RED='\033[0;31m'
GREEN='\033[0;32m'

while getopts "f" options; do
    case "${options}" in         
        f)                       
        echo "success"   
        ;;
        
    esac
done

check_pass(){
    
    if [[ $len -ge 10 ]]
    then
        if [[ $password =~ [[:alpha:]] && $password =~ [[:digit:]] ]]; then 
            if [[ "$password" =~ [[:upper:]] ]] && [[ "$password" =~ [[:lower:]] ]]; then 
                    echo -e "${GREEN}password is good"
                    exit 0
                    
            else 
                    echo -e "${RED}password must include both the small and capital case letters. $?"
                    exit 1
                fi        
        else 
            echo -e "${RED}password must Contain both alphabet and number $?" 
            exit 1
        fi       
    else
    echo -e "${RED}password must contain minimum of 10 characters $?"
    exit 1
    fi
}
check_pass password
