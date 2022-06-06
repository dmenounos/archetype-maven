
## This archetype generates a JEE project with a single module

## The module contains:

- MVC sample with a servlet controller, a JSP page and taglib for templating.

## 1. Install this archetype

```
mvn clean install
mvn archetype:update-local-catalog
```

## 2. Create a new project based on this archetype

```
cd YOUR_WORKSPACE

either invoke mvn and provide project information in interactive mode:
mvn archetype:generate -DarchetypeCatalog=local

or invoke mvn and provide project information as parameters:
mvn archetype:generate -DarchetypeCatalog=local -DinteractiveMode=false \
-DarchetypeGroupId=org.example -DarchetypeArtifactId=jee-single-archetype -DarchetypeVersion=1.0.0-SNAPSHOT \
-DgroupId=YOUR_GROUPID -DartifactId=YOUR_ARTIFACTID
```
