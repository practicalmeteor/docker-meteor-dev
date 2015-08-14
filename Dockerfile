FROM phusion/baseimage:0.9.17

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV NVM_DIR /nvm
ENV NODE_VERSION 0.10.36
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
ENV SMB_NETBIOS_NAME "name"
ENV SMB_PASSWD "pass"
ENV GIT_USER_NAME "jmsegrev"
ENV GIT_USER_EMAIL "juanmanuel@verges.com.do"


ADD ./smb.conf /
ADD ./local/bin /local/bin

RUN /local/bin/install-linux-packages.sh
RUN /local/bin/install-node.sh
RUN /local/bin/install-npm-packages.sh
RUN /local/bin/install-meteor.sh
RUN /local/bin/install-samba.sh $SMB_NETBIOS_NAME $SMB_PASSWD
RUN /local/bin/init-git.sh $GIT_USER_NAME $GIT_USER_EMAIL


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

