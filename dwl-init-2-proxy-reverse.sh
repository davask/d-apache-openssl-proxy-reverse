#!/bin/bash
echo "PROCESSING ENV VAR TO /tmp/dwl_proxy_projects.yml";
/tmp/dwl-env2yaml-0-proxy.sh
echo "PROCESSING /tmp/dwl_proxy_projects.yml TO VIRTULHOSTS";
perl /tmp/dwl-yaml2virtualhost-0-proxy.pl
