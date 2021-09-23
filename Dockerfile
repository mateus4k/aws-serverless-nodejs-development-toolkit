ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}

# Install base dependencies
RUN apt-get update -qq \
    && apt-get -y install -qq curl zip

# Install node, npm and serverless framework
ENV NVM_DIR /root/.nvm
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

RUN curl -sS -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | /bin/bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION 1> /dev/null \
    && npm -g config set user root \
    && npm install -g -s serverless

# Install AWS Cli
ARG TMP_AWS_ZIP=awscliv2.zip

RUN curl -sS "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $TMP_AWS_ZIP \
    && unzip $TMP_AWS_ZIP 1> /dev/null \
    && ./aws/install \
    && rm -rf $TMP_AWS_ZIP

# Setup AWS credentials
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

WORKDIR /www
COPY . .

CMD []
