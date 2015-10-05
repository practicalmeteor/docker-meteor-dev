FROM phusion/passenger-nodejs:0.9.17

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ADD ./add/usr/local/bin/upgrade-linux.sh /usr/local/bin/
RUN /usr/local/bin/upgrade-linux.sh

ADD ./add/usr/local/bin/install-linux-packages.sh /usr/local/bin/
RUN /usr/local/bin/install-linux-packages.sh

ADD ./add/usr/local/bin/install-node.sh /usr/local/bin/
RUN /usr/local/bin/install-node.sh

ADD ./add/usr/local/bin/install-npm-packages.sh /usr/local/bin/
RUN /usr/local/bin/install-npm-packages.sh

ADD ./add/usr/local/bin/add-meteor-user.sh /usr/local/bin/
RUN /usr/local/bin/add-meteor-user.sh

ENV TERM xterm

ADD ./add/usr/local/bin/install-meteor.sh /usr/local/bin/
RUN /usr/local/bin/install-meteor.sh

ADD ./add/usr/local/bin/install-meteor-distribution.sh /usr/local/bin/
RUN /usr/local/bin/install-meteor-distribution.sh

ADD ./add/etc/my_init.d/init-bashrc.sh /etc/my_init.d/

# To fix the "WARNING: terminal is not fully functional" message
ENV NODE_VERSION 0.10.40

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000 3100
