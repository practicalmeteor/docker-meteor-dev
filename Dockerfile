FROM phusion/baseimage:0.9.17

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV NODE_VERSION 0.10.36
ENV TRAVIS 0
ENV SMB_NETBIOS_NAME "name"
ENV SMB_PASSWD "pass"
ENV GIT_USER_NAME "jmsegrev"
ENV GIT_USER_EMAIL "juanmanuel@verges.com.do"

# ...put your own build instructions here...

# Install linux packages
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update
RUN apt-get -y install vim wget curl git tree ntp fontconfig zip jq default-jre mongodb-org-shell mongodb-org-tools samba

# Install node via nvm
ADD curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
RUN nvm install $NODE_VERSION
RUN nvm alias default $NODE_VERSION
RUN nvm use default
# TODO set nvm in bashrc

# Install meteor
RUN if [ $TRAVIS == 0 ]; then curl https://install.meteor.com/ | sh || meteor --version; fi

# Install npm global deps
RUN install -g semver@5.0.1 deep-extend-cli@0.4.0 grunt-cli@0.1.13 coffee-script@1.9.3 iced-coffee-script@108.0.7

# Configure samba
ADD ./smb.conf /smb.conf
RUN sed s/developervm/$SMB_NETBIOS_NAME/ /smb.conf > /etc/samba/smb.conf
RUN rm smb.conf

RUN service smbd restart
RUN service nmbd restart

# Configure ssh
RUN /bin/bash echo -e "$SMB_PASSWD\$SMB_PASSWD\n" | smbpasswd -a -s

RUN git config --replace-all --global user.name  $GIT_USER_NAME
RUN git config --replace-all --global user.email $GIT_USER_EMAIL

RUN mkdir -p ~/.ssh
RUN echo -e 'Host github.com\n\tStrictHostKeyChecking no\n\tLogLevel ERROR\n' >> ~/.ssh/config

# Create your github ssh key
RUN ssh-keygen -t rsa -C $GIT_USER_EMAIL -f ~/.ssh/id_rsa -N ''
RUN cat ~/.ssh/id_rsa.pub


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

