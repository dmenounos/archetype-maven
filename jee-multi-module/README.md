
## This archetype generates a JEE project with the following modules

### Service API module:

- Client interfaces and classes for the EJB service.

### Service module:

- Sample of a EJB Stateless service.

### UI module:

- Sample of a REST JAX-RS resource.
- Sample of a MVC servlet controller.
- JSP page and taglib for templating.

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
-DarchetypeGroupId=org.example -DarchetypeArtifactId=jee-simple-archetype -DarchetypeVersion=1.0.0-SNAPSHOT \
-DgroupId=YOUR_GROUPID -DartifactId=YOUR_ARTIFACTID
```

## Versions

- Classic MVC + Modern REST + EJB Service  (WAR deployment) - jee-multi-module-1.0.0 <-- this version
- Classic MVC + Modern REST + SOAP Service (WAR deployment) - jee-multi-module-2.0.0
- Classic MVC + Modern REST + SOAP Service (EAR deployment) - jee-multi-module-3.0.0
