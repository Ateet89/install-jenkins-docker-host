FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y lsb-release
# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io

# Create an entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins
USER jenkins

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]