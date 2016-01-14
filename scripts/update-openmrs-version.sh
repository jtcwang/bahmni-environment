#! /bin/sh
PATH_OF_CURRENT_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

display_usage() {
    echo 'Change the dependency version of OpenMRS to the specified version in all pom.xml files'
    echo 'pom.xml files in child directories will be changed too'
    echo 'Folders to check: ../openmrs-distro-bahmni ../bahmni-core ../openmrs-module-bedmanagement'
    echo -e "\nUSAGE:\n$0 [version] \n"
    echo -e "Example Usage:\n$0 "1.11-SNAPSHOT""
}

if [ $# -eq 0 ] || [ $# -gt 2 ]; then
    display_usage
    exit 1
fi

export REPLACE_VERSION="$1"
BASE_ABREV=${2:-"$PATH_OF_CURRENT_SCRIPT/../.."}
BASE_ABS=$(cd $BASE_ABREV; pwd)

echo -e "Using $BASE_ABS as the base search path..."

echo -e "\nIn directory $BASE_ABS searching for pom.xml files and running string replacement...\n"
if [ -d "$BASE_ABS" ]; then
    # Find all pom.xml files recursively in the folder
    # and perform the substitution
    find "$BASE_ABS" -name 'pom.xml' \
        -exec echo "Found {}" \; \
        -exec perl -pi -e 's,(<openMRSVersion>)[^<]*(<\/openMRSVersion>),\1$ENV{REPLACE_VERSION}\2,g' {} \;
else
    echo "$BASE_ABS doesn't exist, skipping..."
    exit 1
fi
