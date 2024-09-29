# Use the official Docker-in-Docker image
FROM docker:latest

# Install dependencies for JDK 17
RUN apk update && apk add --no-cache openjdk17 shadow

# Set JAVA_HOME environment variable for JDK 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# (Optional) Verify Docker and Java installations
RUN docker --version && java -version

# Create a new user and group (optional, but not switching to this user)
#RUN addgroup -S mygroup && adduser -S myuser -G mygroup

# Ensure the container runs as root
USER root

# Set the working directory
#WORKDIR /app

# Start the Docker daemon (Docker-in-Docker setup)
CMD ["dockerd-entrypoint.sh"]
