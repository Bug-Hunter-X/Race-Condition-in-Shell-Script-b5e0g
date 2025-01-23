#!/bin/bash

# This script demonstrates how to avoid the race condition using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Create a lock file
lock_file="lock.txt"

# Function to acquire a lock
function acquire_lock() {
  while true; do 
    if [ ! -e "$lock_file" ]; then
      touch "$lock_file"
      return 0
    fi
    sleep 0.1  # Wait for a short period before checking again
  done
}

# Function to release a lock
function release_lock() {
  rm "$lock_file"
}

# Acquire lock for file1
acquire_lock
echo "Content 1" > file1.txt
release_lock

# Acquire lock for file2
acquire_lock
echo "Content 2" > file2.txt
release_lock

# Check the content of the files
cat file1.txt
cat file2.txt