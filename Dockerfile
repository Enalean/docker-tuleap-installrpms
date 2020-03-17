FROM centos:6

COPY tuleap.repo /etc/yum.repos.d/

RUN yum install -y openssh-server \
    createrepo \
    epel-release \
    centos-release-scl \
    curl \
    https://rpms.remirepo.net/enterprise/remi-release-6.rpm && \
    yum install -y --disableexcludes=Tuleap \
        tuleap-documentation \
        rh-mysql57-mysql \
        rh-mysql57-mysql-server \
	&& \
    yum clean all

COPY tuleap-local.repo /etc/yum.repos.d/

COPY mysql-server.cnf /etc/opt/rh/rh-mysql57/my.cnf.d/mysql-server.cnf

COPY install.sh /install.sh
COPY run.sh /run.sh

VOLUME ["/output"]

ENTRYPOINT ["/run.sh"]
