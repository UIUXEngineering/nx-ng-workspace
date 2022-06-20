#!/usr/bin/env bash

# TO RUN
# bash <(curl -sL https://gist.github.com/jerryorta-dev/ee1c8009ac923e37e0c18a84d9566616/raw/nx-ng-workspace.sh)

# Create Nx Workspace
npx create-nx-workspace@latest

# Add Material
npm install @angular/material && npx nx g @angular/material:ng-add
