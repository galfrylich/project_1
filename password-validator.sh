#!/bin/bash    

password=$1 # get first argument
len="${#password}" # check the length of password

RED='\033[0;31m' # colors for output for user
GREEN='\033[0;32m'

check_pass(){
    
    if [[ $len -ge 10 ]] #check if password greater than 10
    then
        if [[  $password =~ [[:digit:]] ]]; then #check if password with digit.
            if [[ "$password" =~ [[:upper:]] ]] && [[ "$password" =~ [[:lower:]] ]]; then #check if password with lower and upper case letters.
                    echo -e "${GREEN}password is good"
                    exit 0
                    
            else 
                    echo -e "${RED}password must include both the small and capital case letters. "
                    exit 1
                fi        
        else 
            echo -e "${RED}password must Contain digits" 
            exit 1
        fi       
    else
    echo -e "${RED}password must contain minimum of 10 characters"
    exit 1
    fi
}
#execute function with password argument 
check_pass password
