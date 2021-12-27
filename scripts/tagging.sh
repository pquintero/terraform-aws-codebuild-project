#!/bin/bash

apt-get update
apt-get install -y jq git awscli

GIT_TAG_LATEST=$(curl -s -u ''${GIT_USER}':'${GIT_PASS}'' --request GET https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_FULL_NAME}/refs/tags?sort=-name | jq .values[0] | jq -r .name)

MAJOR_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f1)
MINOR_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f2)
PATCH_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f3)

PATCH_VERSION=$((PATCH_VERSION+1))

git config --global user.email "${GIT_USER}"
git config --global user.name "buildbot"

mkdir -p ~/.ssh/
aws s3 sync s3://bancoripley-ci/ssh/buildbot/ ~/.ssh/
chmod 400 ~/.ssh/id_rsa
ssh-keygen -F bitbucket.org || ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts

rm -rf /tmp/git/ && mkdir -p /tmp/git/ && cd /tmp/git/
git clone git@bitbucket.org:${BITBUCKET_REPO_FULL_NAME}.git

cd /tmp/git/$(echo ${BITBUCKET_REPO_FULL_NAME} | cut -d "/" -f2)/ && git checkout master
git tag -a v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION} -m "release v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
git push origin --tags