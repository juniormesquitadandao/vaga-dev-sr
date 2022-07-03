#!/bin/sh

set -e

# cp -r ~/.aws .aws

docker build . -f devops/codebuild/Dockerfile -t vaga-dev-sr -q

