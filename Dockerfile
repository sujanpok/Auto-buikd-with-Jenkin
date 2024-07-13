# Use an OpenJDK runtime suitable for ARM architecture
FROM arm32v7/openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the Maven project's JAR file into the container at /app
COPY target/app.jar /app/app.jar

# Expose the port your application uses (adjust as per your application)
EXPOSE 9090

# Run the JAR file
CMD ["java", "-jar", "/app/app.jar"]

