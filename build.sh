#!/bin/bash

ARCH=$(uname -m)

LD_DEBUG=libs docker build -t container/$ARCH -f ./$ARCH/Dockerfile .
docker tag container/$ARCH ${{ secrets.QUAY_REPO }}/test-gh-action-multiarch:latest-$ARCH
docker login quay.io -u ${{ secrets.ROBOT_USER }} -p ${{ secrets.ROBOT_TOKEN }}
docker push ${{ secrets.QUAY_REPO }}/test-gitlab:latest-$ARCH
echo "DONE!"
