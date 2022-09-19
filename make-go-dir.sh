#!/usr/bin/bash
#Rene Sanchez - 2018118383 - CMPS4232 - Quiz 1

#Directory and Identifier variables
Directory=${1}
Identifier=${2}

#Check if parameters are less than 2 or greater than 2. If true display instructions for proper usage, else prompt user to confirm creation of directories.
if [[ $# -lt 2 || $# -gt 2 ]]; then
    echo "You need to provide two arguments for this script to work."
    echo "Usage: make-go-dir <root directory name> <identifier name>"
else
    echo "I am about to create a directory structure named *$Directory*."
    echo "Do you want me to continue? [Yes/no]"
fi

# Get response from user
read Response

#If user confirms creation, created directories, files, etc
if [[ "$Response" = "Yes" ]]; then
    echo "Creating directory structure..."
    mkdir $Directory
    cd $Directory
    mkdir bin cmd cmd/api internals migrations remote
    touch cmd/api/main.go go.mod Makefile

    #add hello world to main.go
    echo -e '// File: cmd/api/main.go \n\npackage main \n\nimport "fmt" \n\nfunc main() { \nfmt.Println("Hello world!") \n}' >> cmd/api/main.go 

    #add identifier to go.mod
    echo "module $Directory.$Identifier" >> go.mod

    #display instructions to test the project
    echo "I have created a *main.go* file for you to test the directory structure."
    echo "Type *go run ./cmd/api* at the root directory of your project to test your project."
    echo "Thank you."

#If user declines, abort the creation of directories
elif [[ "$Response" = "no" ]]; then
    echo "Abort."
fi
