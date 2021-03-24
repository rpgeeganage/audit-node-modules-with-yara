FROM ubuntu:20.04 as audit-node-modules-with-yara

# Working directory
ARG WORK_DIR

# YARA rule folder
ARG YARA_RULE_FOLDER

# Node Module to check
ARG FOLDER_TO_AUDIT

# Result folder
ARG ARTIFACT_FOLDER

# App folder path
ARG EXECUTOR_FOLDER

WORKDIR ${WORK_DIR}

# Installing essentials
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -y install unzip
RUN apt-get -y install python3-pip
RUN apt-get -y install curl
RUN apt-get -y install build-essential
RUN apt-get -y install wget

# Installing NodeJs and yarn
RUN apt-get -y install nodejs

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install yarn

# YARA
RUN apt-get -y install yara 
RUN apt-get -y install yara-doc

# Testing YARA
RUN echo rule dummy { condition: true } > my_first_rule
RUN yara my_first_rule my_first_rule
RUN rm my_first_rule

# Set environment variables
ENV PATH="$HOME/.local/bin:$PATH"

# Copy source code
COPY . .

# Setting environment variables for path
ENV WORK_DIR=${WORK_DIR}
ENV YARA_RULE_FOLDER=${WORK_DIR}/${YARA_RULE_FOLDER}
ENV FOLDER_TO_AUDIT=${WORK_DIR}/${FOLDER_TO_AUDIT}
ENV ARTIFACT_FOLDER=${WORK_DIR}/${ARTIFACT_FOLDER}

# Installing executor dependencies
RUN cd ${EXECUTOR_FOLDER} && yarn install --forzen-lockfile
RUN cd ${EXECUTOR_FOLDER} && yarn build

