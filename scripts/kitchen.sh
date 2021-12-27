#!/bin/bash

apt-get update
apt-get install -y jq

gem install bundler
bundle install --jobs 4 --retry 3
bundle exec kitchen test