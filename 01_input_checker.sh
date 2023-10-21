#!/bin/bash

set -e

# The input_checker script has to check the inputs passed to the script and it has to:
# 1. Only allow 2 arguments. Abort otherwise.
# 2. Argument #1 must be an app name. Allowed values are ONLY: order, payment, login. Abort otherwise.
# 3. Argument #2 must be a number between 1 and 10. Abort otherwise.
allowed_arg_number=2 # Max two params as described in the task
 
if [ "$#" -ne "$allowed_arg_number" ]; then
    echo "error: number of parameters must be exactly $allowed_arg_number"
    exit 1
fi
echo "Accepted '$allowed_arg_number' parameters."

apps_list="order payment login"
if ! grep -wq "$1" <<< $apps_list; then
    echo "error: allowed apps are: order, payment, login. Got: $1"
    exit 1
fi
echo "Accepted '$1' as a valid app."

if ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "error: Argument #2 must be a number between 1 and 10. Got: $2"
    exit 1
fi

if ! ([ $2 -gt 0 ] && [ $2 -le 10 ]); then
    echo "error: Number must be a number between 1 and 10. Got: $2"
    exit 1
fi
echo "Accepted '$2' as a valid max_count."