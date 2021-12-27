#!/bin/bash

BRANCH=$1

PULL_REQUEST_ID=$(curl -s https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_FULL_NAME}/pullrequests \
  -u ''${GIT_USER}':'${GIT_PASS}'' \
  --request POST \
  --header 'Content-Type: application/json' \
  --data '{
        "title": "release",
        "source": {
            "branch": {
                "name": "'${BITBUCKET_BRANCH}'"
            }
        },
        "destination": {
            "branch": {
                "name": "'${BRANCH}'"
            }
        }
    }')

PULL_REQUEST_ID=$(echo ${PULL_REQUEST_ID} | jq .id)

curl -s https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_FULL_NAME}/pullrequests/${PULL_REQUEST_ID}/merge \
  -u ''${GIT_USER}':'${GIT_PASS}'' \
  --request POST