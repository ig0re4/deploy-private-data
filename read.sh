#/bin/sh

file="./$1.properties"

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    key=$(echo $key | tr '.' '_')
    eval "${key}='${value}'"
  done < "$file"

  echo "user name     = " ${username}
  echo "user password = " ${password}
  echo "url           = " ${url}
else
  echo "$file not found."
fi
