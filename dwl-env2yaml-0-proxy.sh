#!/bin/bash

running_project=""

echo "" > /tmp/dwl_proxy_projects.yml;

for dwl_proxy_virtualhost_data in `env | grep DWL_PROXY_ | sort`; do

    echo "> Adding $dwl_proxy_virtualhost_data";
    dwl_proxy_virtualhost_envvar=`echo ${dwl_proxy_virtualhost_data} | cut -d'=' -f1`;
    dwl_proxy_virtualhost_settings=`echo ${dwl_proxy_virtualhost_envvar} | sed 's/DWL_PROXY_//g'`;
    dwl_proxy_virtualhost_values=`echo ${dwl_proxy_virtualhost_data} | cut -d'=' -f2`;
    dwl_proxy_virtualhost_name=`echo ${dwl_proxy_virtualhost_settings} | cut -d'_' -f1`;
    dwl_proxy_virtualhost_env=`echo ${dwl_proxy_virtualhost_settings} | cut -d'_' -f2`;
    dwl_proxy_virtualhost_subdomain=`echo ${dwl_proxy_virtualhost_values} | cut -d'|' -f1`;
    dwl_proxy_virtualhost_domain=`echo ${dwl_proxy_virtualhost_values} | cut -d'|' -f2`;
    dwl_proxy_virtualhost_port=`echo ${dwl_proxy_virtualhost_values} | cut -d'|' -f3`;

    if [ "${dwl_proxy_virtualhost_name}" != "${running_project}" ]; then
        running_project="${dwl_proxy_virtualhost_name}";

        echo "- name: ${dwl_proxy_virtualhost_name}" >> /tmp/dwl_proxy_projects.yml;
        echo "  domain: \"${dwl_proxy_virtualhost_domain}\"" >> /tmp/dwl_proxy_projects.yml;
        echo "  env:" >> /tmp/dwl_proxy_projects.yml;
    fi

    echo "    - name: ${dwl_proxy_virtualhost_env}" >> /tmp/dwl_proxy_projects.yml;
    echo "      subdomain: ${dwl_proxy_virtualhost_subdomain}" >> /tmp/dwl_proxy_projects.yml;
    echo "      port: ${dwl_proxy_virtualhost_port}" >> /tmp/dwl_proxy_projects.yml;

done;
