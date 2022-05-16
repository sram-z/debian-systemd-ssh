# This is a mix of two projects:
# Xavki at: https://gitlab.com/xavki/presentations-scripting/-/blob/master/shell/8-image-docker/Dockerfile
# roberdebock at: https://github.com/robertdebock/docker-debian-systemd/blob/master/Dockerfile
# The goal is to create a container using systemd and ssh for futur ansible projects.

FROM debian:bullseye

ENV container docker
ENV DEBIAN_FRONTEND noninteractive

# Use bullseye-backports
RUN echo 'deb http://deb.debian.org/debian bullseye-backports main' >> /etc/apt/sources.list

# Install systemd, ssh and some utilities
RUN apt-get update ; \
    apt-get install -y --no-install-recommends systemd systemd-sysv python3 sudo bash net-tools openssh-server openssh-client vim ; \
    apt-get clean ; \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config ; \
    sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    rm -rf /lib/systemd/system/multi-user.target.wants/* ; \
    rm -rf /etc/systemd/system/*.wants/* ; \
    rm -rf /lib/systemd/system/local-fs.target.wants/* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ; \
    rm -rf /lib/systemd/system/systemd-update-utmp* ; \
    sed -i 's#root:\*#root:$6$root$N8eFzhP5TW/1Wl1YXkIGagZroL.BmOIKvdCEdFDgndVp1uiOE6pZOZ8e.I/.50xHwXH03TeV0/gBC1ylGDzyJ0#' /etc/shadow

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 22

CMD ["/lib/systemd/systemd"]