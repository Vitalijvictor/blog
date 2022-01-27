# syntax=docker/dockerfile:1

FROM openjdk:11

WORKDIR / main

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 8080

CMD ["./mvnw", "blog"]