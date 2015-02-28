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
                       libicu-dev \
                       git

# Sanity name node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Move Woodhouse into his new home
ADD . /

# Make sure permissions are okay
RUN chmod 755 bin/hubot

# Get Woodhouse settled in
RUN npm install

# Set up Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Give him an ear to the world
EXPOSE 5555
ENV PORT 5555

# Start him up!
CMD ["supervisord"]