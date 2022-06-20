#!/usr/bin/env bash

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

echo "name: $name"
echo "appName: $appName"


# echo "npx create-nx-workspace@latest --preset=angular-nest --name=$workspaceName --appName=$appName --style=scss"




# Add Material
# npm install @angular/material && npx nx g @angular/material:ng-add
