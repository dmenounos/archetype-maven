#!/bin/bash

set -e

# default groupId
GROUP_ID=""

# default artifactId
ARTIFACT_ID=""

# output directory
OUT_DIR=".."

while getopts ":g:a:o:h" OPT; do
	case $OPT in
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
		echo "Usage $0 [OPTIONS]" 1>&2
		echo "OPTIONS" 1>&2
		echo "  -g Project groupId" 1>&2
		echo "  -a Project artifactId" 1>&2
		echo "  -o Output directory" 1>&2
		echo "EXAMPLE" 1>&2
		echo "$0 -g com.example.myproject -a myproject" 1>&2
		exit 1
		;;
	":")
		echo "Option -$OPTARG requires an argument" 1>&2
		exit 1
		;;
	"?")
		echo "Invalid option: -$OPTARG" 1>&2
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

mvn archetype:generate -DinteractiveMode=false \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DgroupId=$GROUP_ID -DartifactId=$ARTIFACT_ID

cat > "$ARTIFACT_ID/pom.xml" << EOM
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">

	<modelVersion>4.0.0</modelVersion>

	<groupId>$GROUP_ID</groupId>
	<artifactId>$ARTIFACT_ID</artifactId>
	<version>1.0.0-SNAPSHOT</version>
	<packaging>jar</packaging>

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<maven.compiler.source>1.8</maven.compiler.source>
		<maven.compiler.target>1.8</maven.compiler.target>
	</properties>

	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>
			<scope>test</scope>
		</dependency>
	</dependencies>

</project>
EOM
