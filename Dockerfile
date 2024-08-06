FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y lsb-release
# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins
USER jenkins