#!/usr/bin/env bash

# https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
while getopts name:app-name: flag
do
    case "${flag}" in
        name) workspaceName=${OPTARG};;
        app-name) appName=${OPTARG};;
    esac
done

echo "npx create-nx-workspace@latest --preset=angular-nest --name=$workspaceName --appName=$appName --style=scss"




# Add Material
npm install @angular/material && npx nx g @angular/material:ng-add
