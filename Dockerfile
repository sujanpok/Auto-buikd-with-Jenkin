# Use an OpenJDK runtime suitable for ARM architecture
FROM arm32v7/openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the project's JAR file into the container at /app
COPY target/app.jar /app/app.jar

# Make port 9090 available to the world outside this container
EXPOSE 9090

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
