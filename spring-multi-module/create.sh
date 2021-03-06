#!/bin/bash

set -e

# default groupId
GROUP_ID=""

# default artifactId
ARTIFACT_ID=""

# output directory
OUT_DIR=".."

while getopts ":g:a:o:h" opt; do
	case $opt in
	"g")
		GROUP_ID="$OPTARG"
		;;
	"a")
		ARTIFACT_ID="$OPTARG"
		;;
	"o")
		OUT_DIR="$OPTARG"
		;;
	"h")
		echo "Usage $0 [OPTIONS]" >&2
		echo "OPTIONS" >&2
		echo "  -g Project groupId" >&2
		echo "  -a Project artifactId" >&2
		echo "  -o output directory" >&2
		echo "EXAMPLE" >&2
		echo "$0 -g com.example.myproject -a myproject" >&2
		exit 1
		;;
	":")
		echo "Option -$OPTARG requires an argument" >&2
		exit 1
		;;
	"?")
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	esac
done

if [ -z "$GROUP_ID" ] || [ -z "$ARTIFACT_ID" ]; then
	$0 -h
	exit 1
fi

OUT_DIR=${OUT_DIR%/}
OUT_DIR="$(cd "$OUT_DIR" && pwd)"

# Confirm the creation of new project

echo -n "Create $OUT_DIR/$ARTIFACT_ID (y/n) "
read CONFIRM_CREATE

if [ $CONFIRM_CREATE != "y" ]; then
	exit 1
fi

# Confirm the deletion of existing project

if [ -d "$OUT_DIR/$ARTIFACT_ID" ]; then
	echo -n "Delete existing $OUT_DIR/$ARTIFACT_ID (y/n) "
	read CONFIRM_DELETE

	if [ $CONFIRM_DELETE != "y" ]; then
		exit 1
	fi

	rm -rf "$OUT_DIR/$ARTIFACT_ID"
fi

cd "$OUT_DIR"

mvn archetype:generate -DarchetypeCatalog=local -DinteractiveMode=false \
-DarchetypeGroupId=org.example -DarchetypeArtifactId=spring-multi-archetype -DarchetypeVersion=1.0.0-SNAPSHOT \
-DgroupId=$GROUP_ID -DartifactId=$ARTIFACT_ID
