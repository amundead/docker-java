# Use the official Docker-in-Docker image
FROM docker:latest

# Install dependencies for JDK 17 and shadow for usermod
RUN apk update && apk add --no-cache openjdk17 shadow

# Set JAVA_HOME environment variable for JDK 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Ensure the container runs as root or switch to myuser (if necessary)
USER root

# Start the Docker daemon (DinD setup)
CMD ["dockerd-entrypoint.sh"]
