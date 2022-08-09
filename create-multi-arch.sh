#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create ${{ secrets.QUAY_REPO }}/test-gitlab:latest \
${{ secrets.QUAY_REPO }}/test-gh-action-multiarch:latest-x86_64 ${{ secrets.QUAY_REPO }}/test-gh-action-multiarch:latest-ppc64le

docker manifest inspect ${{ secrets.QUAY_REPO }}/test-gh-action-multiarch:latest

docker login quay.io -u ${{ secrets.ROBOT_USER }} -p ${{ secrets.ROBOT_TOKEN }}

docker manifest push ${{ secrets.QUAY_REPO }}/test-gh-action-multiarch:latest
