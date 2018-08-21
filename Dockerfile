FROM centos:7

ENV container docker

COPY tuleap.repo /etc/yum.repos.d/
COPY install-and-run.service /etc/systemd/system

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/* && \
    yum install -y \
        openssh-server \
        createrepo \
        epel-release \
        centos-release-scl \
        https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum install -y rh-mysql57-mysql-server && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    systemctl enable install-and-run.service

COPY tuleap-local.repo /etc/yum.repos.d/
COPY install.sh /install.sh
COPY run.sh /run.sh
COPY mysql-server.cnf /etc/opt/rh/rh-mysql57/my.cnf.d/rh-mysql57-mysql-server.cnf

VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/output" ]
CMD ["/usr/sbin/init"]
