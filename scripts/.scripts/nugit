#!/bin/sh

# Globals
WORKING="/home/blix/Programming/github/"    # Your project directory
USER="blixuk"                               # Github Username
PROJECT=$1                                  # Project Name

cd $WORKING                                 # Change to github project directory
mkdir $PROJECT                              # Make a new directory with project name
cd $PROJECT                                 # Change to new project directory
touch "README.md"                           # Create README.md file to init github repository
echo "# ${PROJECT}" > "README.md"           # Add new project name as file header

git init                                    # Init new git repository
git add README.md                           # Add the README.md to the repository
git commit -m "Project Created"             # Add a commit message

# User github API to remotely create a new repository
curl -u $USER https://api.github.com/user/repos -d "{\"name\":\"${PROJECT}\",\"description\":\"New project: ${PROJECT}\"}"

git remote add origin https://github.com/$USER/$PROJECT.git     # Add this repository
git push -u origin master                                 # Push everything to the master branch

code "$WORKING/$PROJECT"                    # Open VS Code with new project