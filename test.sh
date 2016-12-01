#!/bin/bash

if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)


echo "Cleaning and building"
npm run build


rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi


echo "copying dockerfile and packaje.js to build"
cp ./Dockerfile ./build/
cp ./package.json ./build/
cp ./run.sh ./build/

echo "opening build directory"
cd build

echo "Building"
docker build -t aevartg/tictactoe:$GIT_COMMIT .
echo "composing"
docker-compose up



docker build -t aevartg/tictactoe:$GIT_COMMIT .

rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

docker push aevartg/tictactoe:$GIT_COMMIT
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

echo "Done"
