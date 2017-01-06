#/bin/sh

domain=$1
dec_password=$2

in=$domain".enc"
out=$domain".properties"

if [ -f "$in" ]
then
	echo "$in found."
	openssl enc -aes-256-cbc -d -in $in -out $out -k $dec_password
  	if [ -f "$out" ]
  	then
  		echo "$out found."
  		while IFS='=' read -r key value
  		do
    			key=$(echo $key | tr '.' '_')
    			eval "${key}='${value}'"
  			done < "$out"

  			echo "user name     = " ${username}
  			echo "user password = " ${password}
  			echo "url           = " ${url}
		rm -rf $out
	else
  		echo "$out not found."
	fi
else
	echo "$in not found."
fi
