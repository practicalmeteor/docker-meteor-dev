FROM practicalmeteor/ngrok2

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV HOME /
ENV NVM_DIR /nvm
ENV NODE_VERSION 0.10.36
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
ENV WORKSPACE /repos

ADD ./local/bin /local/bin
ADD ./etc/my_init.d /etc/my_init.d
RUN chmod +x /etc/my_init.d/*

RUN /local/bin/install-linux-packages.sh
RUN /local/bin/install-node.sh
RUN /local/bin/install-npm-packages.sh
RUN /local/bin/install-meteor.sh

VOLUME /repos

WORKDIR $WORKSPACE/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

