#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously to write to the files
(echo "Content 1" > file1.txt &) 
(echo "Content 2" > file2.txt &) 

# Wait for both processes to finish
wait

# Check the content of the files.  The content might be overwritten depending on the race condition.
cat file1.txt
cat file2.txt

#This script may not always produce an error but it is prone to race condition error which is difficult to debug.