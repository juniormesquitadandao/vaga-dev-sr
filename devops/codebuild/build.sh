#!/bin/sh

set -e

docker build . -f devops/codebuild/Dockerfile -t vaga-dev-sr --build-arg ARG_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID  --build-arg ARG_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -q

