# I suppose this is the image even if it said to be deprecated
# Docker Hub page shows an example usage FROM openjdk:11
FROM openjdk:8

EXPOSE 8080

# does this work here too?
WORKDIR /usr/src/app

# COPY the project
COPY . .

# build with Maven
RUN ./mvnw package

# run the application
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]