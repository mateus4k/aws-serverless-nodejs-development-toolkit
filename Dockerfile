ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}

# Install base dependencies
RUN apt-get update -qq \
    && apt-get -y install -qq curl zip

# Install Node and Npm
ENV NVM_DIR /root/.nvm
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}
RUN curl -sS -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | /bin/bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION

# Install AWS Cli
ARG TMP_AWS_ZIP=awscliv2.zip
RUN curl -sS "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $TMP_AWS_ZIP \
    && unzip $TMP_AWS_ZIP 1> /dev/null \
    && ./aws/install \
    && rm -rf $TMP_AWS_ZIP

