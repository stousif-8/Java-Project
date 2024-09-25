# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/*.jar app.jar
# Expose the port your application runs on
EXPOSE 8081
# Specify the default command to run on container startup
CMD ["java", "-jar", "app.jar"]
