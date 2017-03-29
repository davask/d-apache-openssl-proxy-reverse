#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

#############
# README.md #
#############

echo "# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-apache-openssl)

## EXAMPLE

You can find a virtualhost exemple for port 443 at the following path
/dwl/default/etc/apache2/sites-available/0000-docker.davaskweblimited.com-443.conf

## LABEL

> dwl.server.proxy=\"proxy\"
" > ${rootDir}/README.md

echo "README.md generated with Proxy:${branch}";
