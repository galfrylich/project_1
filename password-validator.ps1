
function check_password{
    [string]$password= $args[0];#get first argument
    
    if($password.length -ge 10){ #check if password greater or equal to 10 
        if($password -match "\d"){ # check if password contains digits
            if(($password -cmatch "[a-z]") -and ($password -cmatch "[A-Z]")){  #checks if password contains both upper and lower case letters
                Write-Host "password is GOOD" -ForegroundColor green
                Exit 0
            }
            else{
                Write-Host "password must include both small letters and capital case letters" -ForegroundColor red
                Exit 1
            }

        }
        else{
            Write-Host "password must contain digits" -ForegroundColor red
            Exit 1
        }
    }
    else{
        Write-Host "password must contain minimum of 10 characters" -ForegroundColor red
        Exit 1
    }

}

function read_txt_file(){
    $argument = $args[0]
    $file_data=Get-Content ./$argument #get text from file
    check_password $file_data # execute check password function
    

}


$first_argument=$args[0] #get first argument
if($first_argument -ne "-f"){ #if it contains -f flag go to readtext function else go to check password function
    check_password $first_argument
}
else{
    $second_argument=$args[1] #get second argument the name of txt file
    Write-Host $second_argument
    read_txt_file $second_argument # execute function 
}