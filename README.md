# sergeygerbek/ansible_dockerized
- [Introduction](#introduction)
- [Running](#running)

# Introduction
Dockerfile for creating basic Ansible container (without plugins).

# Running
```bash
docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/id_rsa sergeygerbek/ansible:2.9.27 ansible-playbook --version
```
