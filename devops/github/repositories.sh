#!/bin/sh

set -e

curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GITHUB_PERSONAL_ACCESS_TOKEN}" https://api.github.com/repositories
