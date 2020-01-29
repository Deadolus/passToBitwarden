#!/bin/bash
#Converts password files (*.gpg) from ZX2C4 pass standard linux password manager (https://www.passwordstore.org/)
#in the current folder and subfolders in to csv output.
#Uses the pass executable for decrypting the files
#The csv has Bitwarden format (folder,favorite,type,name,notes,fields,login_uri,login_username,login_password,login_totp)
#Works but threats a big part of the output as notes in Bitwarden,
#so some manual cleanup is required after importing in to bitwarden

convert_pass() {
  name=$1
  mapfile -t lines < <(pass $name)
  url=`basename $name`
  username=`echo ${lines[1]} | sed  's/^.*: //'`
  password=${lines[0]}
  folder=`dirname ${name}`
  #The rest of lines are notes
  notes=("${lines[@]:2}")
  notes=${notes[@]}
  echo "$folder,,login,$url,$notes,,$url,$username,$password,"
}

readarray -t files < <(find . -type f | grep -v '/\.' | grep gpg | sed 's/^\.\///' | sed 's/\.gpg//')
echo folder,favorite,type,name,notes,fields,login_uri,login_username,login_password,login_totp
for file in "${files[@]}"
do
  convert_pass $file
done
