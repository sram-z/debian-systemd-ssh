# Docker debian-systemd-ssh

A Debian docker image with built-in systemd and ssh.

- [Docker debian-systemd-ssh](#docker-debian-systemd-ssh)
  - [Get the docker image](#get-the-docker-image)
  - [Manually run docker container](#manually-run-docker-container)
  - [Thanks to](#thanks-to)

---

![Docker Image Size (tag)](https://img.shields.io/badge/docker%20build-passing-green?style=flat)
![Docker Image Size (tag)](https://img.shields.io/badge/image%20size-88.78%20MB-blue)

>:warning: Take a look on [Docksible](https://github.com/sram-z/docksible) to help you manage easily this image and test your deployments with [Ansible](https://docs.ansible.com/).

>:grey_exclamation: The image tag corresponds to the debian stable version.

|  Debian Version    |  Docker image tag|
|:------------------:|:----------------:|
|  Bullseye          |       latest     |
|  Bullseye          |       v11        |

---

## Get the docker image

```bash
docker pull sramz/debian-systemd-ssh:latest
```

>:warning: Inside the container the root password is root by default. Of course, **you should change it**!

## Manually run docker container

```bash
docker run \
    -tid --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    --cgroupns=host \ 
    sramz/debian-systemd-ssh:latest
```

Then, execute for example a shell inside your container:

```bash
docker exec ti <id_or_tag_of_your_container> bash
```

## Thanks to

- [roberdebock](https://github.com/robertdebock/docker-debian-systemd/blob/master/Dockerfile) for his Dockerfile.
  