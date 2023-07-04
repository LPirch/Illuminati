# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

##### 
## Image Configuration
#####

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# app user name
# ENV USERNAME="jeff"
ENV USERNAME="root"

# switch default shell from /bin/sh to /bin/bash to be able to use source
SHELL ["/bin/bash", "-c"]

##### 
## Tool Setup
#####

# Creates a non-root user with an explicit UID and adds permission to access the /longscope folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" ${USERNAME}

# Install dev dependencies

RUN apt update && \
    apt install -y git 

# Install jupyter notebook
RUN python -m pip install notebook

##### 
## Application Setup
#####

WORKDIR /illuminati
COPY . /illuminati

# RUN chown -R ${USERNAME} /strucky

# RUN python -m pip install -e .

# USER ${USERNAME}}

# # During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# CMD ["jupyter notebook", "--autoreload"]
