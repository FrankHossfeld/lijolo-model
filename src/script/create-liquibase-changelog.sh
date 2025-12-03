#!/bin/sh

# This script will create a changelog by comparing lijolo-prod against lijolo-dev
#
# changelog-file
#
# Naming:
#
# 'changelog-release-' + [version of release] + '.yml'
version=1.1.
echo creati0g change log for release $version

changeLogFile="db.changelog-$version.yaml"
echo changeLogFileName is: $changeLogFile

# create dir name
cd "change-logs" || exit
echo change dir to change-logs

# create version directory
if [ ! -L "$version" ]
then
    mkdir -p  "$version"
fi
cd "$version" || exit

# check if file exist. if true, delete it!
if [ -f "$changeLogFile" ]; then
    rm "$changeLogFile"
    echo "$changeLogFile" deleted
fi

# create changelog
liquibase diff-changelog \
  --url="jdbc:postgresql://localhost:5462/lijolo-dev" \
  --username=postgres \
  --password=postgres \
  --reference-url="jdbc:postgresql://localhost:5463/lijolo-prod" \
  --reference-username=postgres \
  --reference-password=postgres \
  --changelog-file=$changeLogFile
