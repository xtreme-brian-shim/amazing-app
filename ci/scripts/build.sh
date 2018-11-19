#!/usr/bin/env bash

set -evx

export PROJECT_ROOT=$(pwd)
export GRADLE_USER_HOME=$PROJECT_ROOT/.gradle

pushd $1

./gradlew build -x test
mv "$1/build/libs/amazing-app-0.0.1-SNAPSHOT.jar" deploy/
mv "$1/ci/manifest.yml" deploy/

SANITIZED_ROUTE=$(echo ${route} | sed 's|https://||g')
sed -i '' 's/\[ROUTE\]/'"${SANITIZED_ROUTE}"'/g' deploy/manifest.yml