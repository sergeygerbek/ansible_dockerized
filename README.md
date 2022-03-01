# sergeygerbek/aqnsible-dockerized
- [Introduction](#introduction)
- [Debug](#debug)
    - [System Shell](#system-shell)
- [Exposed Ports](#exposed-ports)

# Introduction
Dockerfile for creating basic Ansible container (without plugins).

# Running
```bash
docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/id_rsa sergey.gerbek/ansible:2.9.27-ubuntu-20.04
```
