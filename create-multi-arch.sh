#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create $QUAY_REPO/test-gh-action-multiarch:latest \
$QUAY_REPO/test-gh-action-multiarch:latest-x86_64 $QUAY_REPO/test-gh-action-multiarch:latest-ppc64le

docker manifest inspect $QUAY_REPO/test-gh-action-multiarch:latest

docker login quay.io -u $ROBOT_USER -p $ROBOT_TOKEN

docker manifest push $QUAY_REPO/test-gh-action-multiarch:latest
