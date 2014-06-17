# Woodhouse, our very own cyborg butler.

# Extend from official Ubuntu 14.04 LTS
FROM ubuntu:trusty

# We maintain this bad boy!
MAINTAINER Simpla <admin@getsimpla.com>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update everything
RUN apt-get update
RUN apt-get -y upgrade

# Install core dependencies
RUN apt-get install -y wget \
                       redis-server \
                       nodejs \
                       npm \
                       supervisor \
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

# Set up IRC-Slack integration
RUN npm install  --save hubot-irc
ENV HUBOT_IRC_SERVER simpla.irc.slack.com
ENV HUBOT_IRC_ROOMS #random
ENV HUBOT_IRC_NICK woodhouse
ENV HUBOT_IRC_PASSWORD simpla.uINNybfDNFJoErCE9sNp

# Archive slack settings... for now
#ENV HUBOT_SLACK_TOKEN v1U13cHqv4AROYgpCig2kYGe
#ENV HUBOT_SLACK_TEAM simpla
#ENV HUBOT_SLACK_BOTNAME woodhouse
#ENV HUBOT_SLACK_LINK_NAMES 1

# Throw in scripts and plugins
ADD hubot-scripts.json hubot-scripts.json
ADD scripts/ scripts/

# Install dependencies
#RUN npm install --save cleverbot-node
RUN npm install --save scraper
RUN npm install --save htmlparser
RUN npm install --save soupselect
RUN npm install --save wolfram

## Set plugin Variables
ENV HUBOT_ANNOUNCE_ROOMS general,product,random,templates,website
ENV HUBOT_WOLFRAM_APPID YXYG8G-YPGR69XE27

# Set up Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Where shall he live?
EXPOSE 5555
ENV PORT 5555

# Start him up! (see supervisord.conf for runtime settings)
CMD ["supervisord"]