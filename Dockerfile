# Use the official Docker-in-Docker image
FROM docker:latest

# Install dependencies for JDK 17 and shadow for usermod
RUN apk update && apk add --no-cache openjdk17 shadow

# Set JAVA_HOME environment variable for JDK 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Create a new user and group
RUN addgroup -S mygroup && adduser -S jenkins -G mygroup

# Add the new user (myuser) to the docker group
RUN usermod -aG docker jenkins

# Set the working directory
#WORKDIR /app

# Run the container as root to perform Docker-related tasks
USER root

# Start Docker daemon inside the container (DinD)
CMD ["dockerd-entrypoint.sh"]

