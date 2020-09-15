#!/bin/sh
#
find . -type f -iname "*.sh" -exec chmod +x {} \;

pip install -r requirements.txt
npm i

workDir=$(pwd)

scriptDir="ExecutionScripts/docker-execution/shell"

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


