# BuildStage
# =====
FROM maven as build-stage

WORKDIR ./opt

COPY pom.xml ./

COPY src/ ./src/

RUN mvn clean install package -DskipTests



# Stage
# =====
FROM eclipse-temurin
COPY --from=build-stage /opt/target/testingOpenSource-0.0.1-SNAPSHOT.jar /opt/nofomo-backend.jar
EXPOSE 1050
ENTRYPOINT ["java","-jar","./opt/nofomo-backend.jar"]