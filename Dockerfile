FROM centos:6

COPY tuleap.repo /etc/yum.repos.d/

RUN yum install -y openssh-server \
    createrepo \
    epel-release \
    centos-release-scl \
    https://rpms.remirepo.net/enterprise/remi-release-6.rpm && \
    yum install -y --disableexcludes=Tuleap tuleap-documentation && \
    yum clean all

COPY tuleap-local.repo /etc/yum.repos.d/

COPY install.sh /install.sh
COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
