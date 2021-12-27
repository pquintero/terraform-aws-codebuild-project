#!/bin/bash

apt-get update
apt-get install -y unzip curl jq

curl -s https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -o terraform_${TF_VERSION}_linux_amd64.zip
unzip terraform_${TF_VERSION}_linux_amd64.zip
mv terraform /usr/bin/

cat << EOF > ${HOME}/.terraformrc
credentials "app.terraform.io" {
  token = "${TF_TOKEN}"
}
EOF