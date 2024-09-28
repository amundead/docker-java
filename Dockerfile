# Use the latest Docker image
FROM docker:latest

# Install dependencies for JDK 17
RUN apk update && apk add --no-cache openjdk17

# Set JAVA_HOME environment variable for JDK 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Verify installation
RUN java -version

# Optional: Set the working directory and add the application code
# WORKDIR /app
# COPY . /app

# Optional: Set the default command for your application
# CMD ["java", "-jar", "your-application.jar"]

