#!/bin/sh

set -e

docker build . -t vaga-dev-sr_app --build-arg ARG_LINUX_LOCALE=en_US.UTF-8 --build-arg ARG_RUBY_VERSION=3.1.2 --build-arg ARG_NODE_VERSION=18.4.0 -q

AWS_ACCESS_KEY_ID=AKIAXG3UKLQJSHQTQT4F AWS_SECRET_ACCESS_KEY=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
