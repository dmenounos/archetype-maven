
## This archetype generates a Spring project with the following modules

### Service API module:

- Client interfaces and classes for the project's services.

### Service module:

- Implementation of the project's services.

### UI module:

- Sample of a REST controller.

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
-DarchetypeGroupId=org.example -DarchetypeArtifactId=spring-multi-archetype -DarchetypeVersion=1.0.0-SNAPSHOT \
-DgroupId=YOUR_GROUPID -DartifactId=YOUR_ARTIFACTID
```
