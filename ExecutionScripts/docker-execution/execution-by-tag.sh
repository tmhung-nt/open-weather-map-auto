#!/bin/sh
suite_path=$1
tag=$2

robot -d Result_execution/testTag -i ${tag}    ${suite_path}
