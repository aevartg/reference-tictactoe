#!/bin/bash

# installs npm 
echo "installing npm"
npm install --silent

# API testing
echo "Running unit tests"
npm run apitest