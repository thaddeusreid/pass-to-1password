#!/bin/bash
# pass-to-1password
# transform password-store data to an importable CSV file for 1password
#
# https://support.1password.com/create-csv-files/
# 1password supports importing four "types" of items:
# Login, Credit Card, Software License, Secure Note Item
# this script will use the Login type for all password-store entries.
# each row of the csv should use the following format:
# `title,website,username,password,notes,custom field 1/n...`
#
passDir=~/.password-store
now=$(date +"%Y%m%d%H%M%S")
file="pass-to-1password$now.csv"

echo "thank you for using pass-to-1password. hold tight!"

passwords=$(find $passDir -type f -name "*.gpg")
regex="^${passDir}/(.+)\.gpg$"
for pass in $passwords
do
  if [[ $pass =~ $regex ]]
  then
    title="${BASH_REMATCH[1]}"
    website=""
    username=""
    password=""
    notes=""

    # unlock pass, read contents, write them to the csv file
    while read a b
    do
      password="$a"
      notes="$b"
    done <<<$(pass $title)

    # `title,website,username,password,notes,custom field 1/n...`
    row="\"$title\",\"$website\",\"$username\",\"$password\",\"$notes\""
    echo $row >> "$file"
  fi
done

echo "all done, your import file is available here: $file"
