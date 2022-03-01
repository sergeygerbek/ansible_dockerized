#
# Ansible Dockerfile
#
# https://github.com/sergey.gerbek/ansible_dockerized
#

FROM ubuntu:20.04

ARG ANSIBLE_VERSION_ARG="2.9.27"
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION_ARG}

# Labels.
LABEL maintainer="sergey.gerbek@gmail.com" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="sergey.gerbek/ansible" \
    org.label-schema.description="Ansible base inside Docker" \
    org.label-schema.vendor="Sergey Gerbek" \
    org.label-schema.url="https://github.com/sergey.gerbek/ansible_dockerized" \
    org.label-schema.vcs-url="https://github.com/sergey.gerbek/ansible_dockerized" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.cmd="docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/id_rsa sergey.gerbek/ansible:${ANSIBLE_VERSION_ARG}-ubuntu-20.04"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 python python-dev python3-pip python3-virtualenv && \
    apt-get install -y sshpass git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==${ANSIBLE_VERSION} && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
