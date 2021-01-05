#!/bin/bash

set -e

mvn clean install
mvn archetype:update-local-catalog
