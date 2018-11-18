#!/usr/bin/env bash

set -evx

export PROJECT_ROOT=$(pwd)
export GRADLE_USER_HOME=$PROJECT_ROOT/.gradle

pushd $1

./gradlew test

popd