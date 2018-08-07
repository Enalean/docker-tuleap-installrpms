FROM centos:6

RUN yum install -y openssh-server \
    createrepo \
    epel-release \
    centos-release-scl \
    curl && \
    yum clean all

COPY tuleap.repo /etc/yum.repos.d/
COPY tuleap-local.repo /etc/yum.repos.d/
COPY centos-vault-rh-php56.repo /etc/yum.repos.d/

COPY install.sh /install.sh
COPY run.sh /run.sh
RUN chmod u+x /run.sh && chmod u+x /install.sh

VOLUME ["/output"]

ENTRYPOINT ["/run.sh"]
