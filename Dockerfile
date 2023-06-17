# I suppose this is the image even if it said to be deprecated
# Docker Hub page shows an example usage FROM openjdk:11
FROM openjdk:8 as build-stage

WORKDIR /usr/src/app

COPY . .

# build with Maven
RUN ./mvnw package

# eclipse-temurin:8-jre-alpine 50 MB image
FROM eclipse-temurin@sha256:3caa0a38391d96932bdb53abb5420f20786cea5adf5dfc978a1ffcd7a2e74885
EXPOSE 8080

COPY --from=build-stage /usr/src/app/target/docker-example-1.1.3.jar docker-example-1.1.3.jar

#RUN useradd -m appuser # eclipse-temurin uses alpine
RUN adduser -D appuser
USER appuser

# run the application
CMD ["java", "-jar", "./docker-example-1.1.3.jar"]
