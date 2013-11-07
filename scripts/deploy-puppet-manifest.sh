#!/bin/bash

SCRIPTS_DIR=`dirname $0`
BASE_DIR=$SCRIPTS_DIR/..

usage() {
	echo "Usage: run-puppet-manifest.sh <manifest-file>"
	echo "<manifest-file> is the name of a manifest file present in ${BASE_DIR}/puppet/manifests directory"
}

MODULE_NAME=$1
if [ "${MODULE_NAME}a" = "a" ]
then
	echo "Please specify a module to run)"
	usage
	exit 1
fi

puppet apply $BASE_DIR/puppet/manifests/$1.pp --modulepath=$BASE_DIR/puppet/modules/ --detailed-exitcodes
RETURN_CODE=$?
if [ $RETURN_CODE -ne 0 ] && [ $RETURN_CODE -ne 2 ]
then
	echo "Error running script. Return code = ${RETURN_CODE}. Exiting"
	exit 1
else 
	echo "All fine. Return code = ${RETURN_CODE}. Exiting"
	exit 0
fi