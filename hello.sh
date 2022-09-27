#! /bin/bash

function myFun () {
	echo "Hello $1!!"
}

echo "Enter your name?"
read name

myFun $name
