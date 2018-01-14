# Installs filebeat 6.x
FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive

# Update system
RUN apt-get update && apt-get upgrade -y
# Install a couple of tools we need
RUN apt-get install -y gnupg wget

# Get keys
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# Elastic co says to do this
RUN apt-get install -y apt-transport-https

# Add package
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | \
 tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Update package list and install
RUN apt-get update
RUN apt-get install -y filebeat

# Run filebeat, output to STDOUT, and find the conifg file at /etc/filebeat/filebeat.yml
ENTRYPOINT ["filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]