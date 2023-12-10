# Use an official OpenJDK runtime as a base image
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/classes/com/project/staragile/insureme/*.jar app.jar

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
