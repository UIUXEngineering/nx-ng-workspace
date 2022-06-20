#!/usr/bin/env bash

# https://pretzelhands.com/posts/command-line-flags/
# Default values of arguments
WORKSPACE_NAME="demo"
APP_NAME="todo"

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -n=*|--name=*)
        WORKSPACE_NAME="${arg#*=}"
        shift # Remove argument name from processing
        ;;
        -a=*|--appName=*)
        APP_NAME="${arg#*=}"
        shift # Remove argument name from processing
        ;;
        *)
    esac
done

echo "# workspace name: $WORKSPACE_NAME"
echo "# App Name: $APP_NAME"

npx create-nx-workspace@latest --preset=angular-nest --name="$WORKSPACE_NAME" --appName="$APP_NAME" --style=scss --nxCloud=false

echo "cd $WORKSPACE_NAME"
cd "$WORKSPACE_NAME";

# Add Material
npm install @angular/material && npx nx g @angular/material:ng-add --project="$APP_NAME" --theme=custom --typography=true --animations=enabled

git add .
git commit -m "add angular material with custom theme configuration"

