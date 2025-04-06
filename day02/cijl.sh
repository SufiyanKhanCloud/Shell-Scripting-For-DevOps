#!/bin/bash

<< disclaimer
This is just for infotainment purpose
disclaimer

# This is a function definition
function is_loyal() {

read -p "$1 looked whom: " bandi
read -p "$1 ka pyaar %" pyaar

if [[ $bandi == "daya bhabhi" ]]
then
	echo "$1 is loyal"
elif [[ $pyaar -ge 100 ]];
then
        echo "$1 is loyal"
else
	echo "$1 is not loyal"
fi
}

# This is a function call
is_loyal "tom"

