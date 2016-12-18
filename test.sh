#!/bin/bash

if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

# installs npm 
echo "installing npm"
npm install --silent
cd client
npm install --silent
cd ..

#cleans and builds
echo "Cleaning and building"
npm run build

# catches error message if npm build fails
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi

# installs nodemon for testing
npm install nodemon

# Unit testing
echo "Running unit tests"
npm run test

# catches error message if npm test fails
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm unit test failed with exit code " $rc
    exit $rc
fi

# API testing
echo "Running unit tests"
npm run apitest

# catches error message if apitest fails
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm apitest failed with exit code " $rc
    exit $rc
fi

# puts git commit hash to env file in build directory
cat > ./build/.env <<_EOF_
GIT_COMMIT=$GIT_COMMIT
_EOF_

# makes html file with newest version hash and link
cat > ./build/version.html << _EOF_
<!doctype html>
<head>
   <title>App version information</title>
</head>
<body>
   <span>Origin:</span> <span>$GITHUB_URL</span>
   <span>Revision:</span> <span>$GIT_COMMIT</span>
   <p>
   <div><a href="$GITHUB_URL/commits/$GIT_COMMIT">History of current version</a></div>
</body>
_EOF_


# copies dockerfile, package.json and run script to build directory
echo "copying dockerfile and packaje.js to build"
cp ./Dockerfile ./build/
cp ./package.json ./build/
cp ./run.sh ./build/

echo "opening build directory"
cd build

#builds the container
echo "Building"
docker build -t aevartg/tictactoe:$GIT_COMMIT .

# catches error if docker build fails
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

# pushes the container to the docker hub
docker push aevartg/tictactoe:$GIT_COMMIT

# catches error if docker doesnt push
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

cd ..
cd ..

echo "Done"