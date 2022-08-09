#!/bin/bash

ARCH=$(uname -m)

LD_DEBUG=libs docker build -t container/$ARCH -f ./$ARCH/Dockerfile .
docker tag container/$ARCH $QUAY_REPO/test-gh-action-multiarch:latest-$ARCH
docker login quay.io -u $ROBOT_USER -p $ROBOT_TOKEN
docker push $QUAY_REPO/test-gh-action-multiarch:latest-$ARCH
echo "DONE!"
