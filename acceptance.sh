#!/bin/bash

# installs npm 
echo "installing npm"
npm install --silent

echo "starting npm"
npm run start

# API testing
echo "Running apitests"
npm run apitest