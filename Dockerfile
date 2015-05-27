FROM ubuntu:14.04.2
MAINTAINER forbesmyester

ENV provisioning_dir /

WORKDIR ${provisioning_dir}
ADD ./configure-ansible ${provisioning_dir}
RUN ./configure-ansible
ADD ./rpi-subsonic.yml ${provisioning_dir}
RUN ansible-playbook -c local ./rpi-subsonic.yml
VOLUME [/var/subsonic]
