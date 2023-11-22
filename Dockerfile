FROM jenkins/jenkins:lts


ADD ./plugins.txt /tmp/plugins.txt

## Install Jenkins plugins

RUN jenkins-plugin-cli -f /tmp/plugins.txt

## Install docker in docker, other apt packages here.  Build envs should be handled externally.
USER root

RUN apt-get update && apt-get -y --allow-unauthenticated install \    
    curl \
    gnupg2 \
    software-properties-common \
    python3-pip \
    python3-boto3 \
    python3 \
    wget



## TODO: grab this from the current env/build or other external source for security, or better yet, disable this user and just use Active Directory/etc.
ENV JENKINS_LINUX_USER jenkins
ENV UID_JENKINS=1000
ENV GID_JENKINS=1000



USER jenkins
