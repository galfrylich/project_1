#!/bin/bash    

password=$1 # get first argument
len="${#password}" # check the length of password

RED='\033[0;31m' # colors for output for user
GREEN='\033[0;32m'

check_pass(){
    
    if [[ $len -ge 10 ]]
    then
        if [[ $password =~ [[:alpha:]] && $password =~ [[:digit:]] ]]; then 
            if [[ "$password" =~ [[:upper:]] ]] && [[ "$password" =~ [[:lower:]] ]]; then 
                    echo -e "${GREEN}password is good"
                    exit 0
                    
            else 
                    echo -e "${RED}password must include both the small and capital case letters. "
                    exit 1
                fi        
        else 
            echo -e "${RED}password must Contain both alphabet and number " 
            exit 1
        fi       
    else
    echo -e "${RED}password must contain minimum of 10 characters"
    exit 1
    fi
}
#call function with password argument 
check_pass password
