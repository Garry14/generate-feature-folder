#!/bin/bash

# Function to convert folder name to camel case
toCamelCase() {
  echo "$1" | awk -F- '{for(i=1;i<=NF;i++)$i=toupper(substr($i,1,1)) tolower(substr($i,2));}1' | sed 's/-//g'
}

# Prompt the user for input
read -p "Enter the folder name: " FOLDER_NAME

# Check if folder name is provided
if [ -z "$FOLDER_NAME" ]; then
  echo "Error: Please enter a folder name."
  exit 1
fi

# Convert folder name to camel case
CAMEL_CASE_NAME=$(toCamelCase "$FOLDER_NAME")

# Create the main folder
mkdir -p "$FOLDER_NAME/components"

# Create subfolder files
touch "$FOLDER_NAME/components/${CAMEL_CASE_NAME}Filter.jsx"
touch "$FOLDER_NAME/components/${CAMEL_CASE_NAME}Tab.jsx"

# Create main folder files
touch "$FOLDER_NAME/$FOLDER_NAME.constants.js"
touch "$FOLDER_NAME/$FOLDER_NAME.schema.js"
touch "$FOLDER_NAME/$FOLDER_NAME.table-data.js"

echo "Folder structure and files created successfully in $FOLDER_NAME!"
