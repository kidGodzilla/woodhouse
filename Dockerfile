# Woodhouse, our very own cyborg butler.

# Extend from official Ubuntu base
FROM ubuntu

# We maintain this bad boy!
MAINTAINER Simpla <admin@getsimpla.com>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Update everything
RUN apt-get update
RUN apt-get -y upgrade

# Install core dependencies
RUN apt-get install -y wget \
                       git \
                       redis-server \
                       nodejs \
                       npm \
                       supervisor \
                       build-essential \
                       python \
                       libexpat1-dev \
                       libexpat1 \
                       libicu-dev

# Sanity name node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install HUBOT engine and coffee-script
RUN npm install -g hubot coffee-script

# It's alive!
RUN hubot --create .

# Get Woodhouse settled in
RUN npm install

# Make sure permissions are okay
RUN chmod 755 bin/hubot

# Set up Slack integration
RUN npm install  --save hubot-slack
ENV HUBOT_SLACK_TOKEN v1U13cHqv4AROYgpCig2kYGe
ENV HUBOT_SLACK_TEAM simpla
ENV HUBOT_SLACK_BOTNAME Woodhouse
ENV HUBOT_SLACK_LINK_NAMES 1

# Throw in scripts and plugins
ADD hubot-scripts.json hubot-scripts.json
ADD scripts/ scripts/

# Install dependencies
RUN npm install --save cleverbot-node
RUN npm install --save scraper
RUN npm install --save htmlparser
RUN npm install --save soupselect
RUN npm install --save wolfram

######################
## Plugin Variables ##
######################
ENV HUBOT_ANNOUNCE_ROOMS #general, #product, #random, #templates, #website
ENV HUBOT_WOLFRAM_APPID YXYG8G-YPGR69XE27


# Where shall he listen?
ENV PORT 5555
EXPOSE 5555

# Set up Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start him up! (see supervisord.conf for runtime settings)
CMD ["supervisord", "-n"]