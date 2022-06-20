#!/usr/bin/env bash

# https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
while getopts workspace-name: flag
do
    case "${flag}" in
        workspace-name) workspaceName=${OPTARG};;
    esac
done

# Create Nx Workspace
npx create-nx-workspace@latest --preset=angular-nest



# Add Material
npm install @angular/material && npx nx g @angular/material:ng-add
