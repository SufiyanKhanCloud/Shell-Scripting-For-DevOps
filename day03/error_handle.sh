#!/bin/bash

create_directory() {
	mkdir demo
}

if ! create_directory; then
	echo "The code is being exited as the directory already exist"
	exit 1
fi

echo "This should not work because the code is interrupted"

