#! /bin/bash

echo "Transfer initiated"

# Source directory and target directory 
source="source"
target="json_and_CSV"

# Make parent directory for source and target if not exist
mkdir -p "$source"
mkdir -p "$target"

# Move all CSV and Json files from source folder to target folder
mv "$source/*.csv" "$source/*.json" "$target/"

# Confirm file moved succesfully
if ls target/*.csv target/*.json; then 
	echo "Files succesfully moved"
else 
	echo "No files moved"
fi