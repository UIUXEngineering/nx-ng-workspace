#!/usr/bin/env bash

NGRX_VERSION="14.0.0"

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

# Install version of RxJS to support NgRX
npm install rxjs@~7.5.0

npm install @ngrx/store@latest && npx nx g @ngrx/store:ng-add --project="$APP_NAME" --module=app.module.ts
npm install @ngrx/store-devtools@latest && npx nx g @ngrx/store:ng-add --project="$APP_NAME" --module=app.module.ts
npm install @ngrx/component@latest && npx nx g @ngrx/component:ng-add --project="$APP_NAME" --module=app.module.ts
