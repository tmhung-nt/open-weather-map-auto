#!/bin/sh
#
find . -type f -iname "*.sh" -exec chmod +x {} \;

workDir=$(pwd)

cp -rf /src/node_modules /tests

scriptDir="ExecutionScripts/docker-execution/toBeExecuted"

ls $scriptDir

chmod +x "${workDir}/${scriptDir}/"
echo "****** List of test suites to be execute ******"
scripts=`ls -l ${scriptDir}`

for script in $scriptDir/*; do
    cd /tests
	scriptPath=$(echo "${script}")
    echo -e "\n#################### Script to be execute: ${scriptPath} #################### \n"
    eval "$scriptPath"
    sleep 10
done


