# Docker container for initialising a Hubot

# Extend from official Node.js base
FROM node

# We maintain this bad boy!
MAINTAINER Simpla <admin@getsimpla.com>

# Install vanilla HUBOT and coffee-script
RUN npm install -g hubot coffee-script

# It's alive!
RUN hubot --create .

# Make sure permissions are okay
chmod 755 ./bin/hubot

# Set up Slack integration
RUN npm install hubot-slack --save
ENV HUBOT_SLACK_TOKEN v1U13cHqv4AROYgpCig2kYGe
ENV HUBOT_SLACK_TEAM simpla
ENV HUBOT_SLACK_BOTNAME Woodhouse
ENV HUBOT_SLACK_LINK_NAMES 1

# Throw in scripts and plugins
ADD hubot-scripts.json hubot-scripts.json
ADD scripts/* scripts/

# Install dependencies


######################
## Plugin Variables ##
######################





# Give him a name and start him up!
CMD ["nohup bin/hubot -n woodhouse"]
