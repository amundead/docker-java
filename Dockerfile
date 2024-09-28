# Use the official Docker-in-Docker image
FROM docker:latest

# Install dependencies for JDK 17
RUN apk update && apk add --no-cache openjdk17

# Set JAVA_HOME environment variable for JDK 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Start the Docker daemon in the container
CMD ["dockerd-entrypoint.sh"]
