FROM centos:centos6

MAINTAINER Thomas Gerbet <thomas.gerbet@enalean.com>

RUN yum install -y openssh-server createrepo \
    epel-release &&\
    yum clean all

COPY RPM-GPG-KEY.dag.txt /
RUN rpm --import /RPM-GPG-KEY.dag.txt

COPY rpmforge.repo /etc/yum.repos.d/
COPY tuleap.repo /etc/yum.repos.d/
COPY tuleap-local.repo /etc/yum.repos.d/

ADD run.sh /run.sh
RUN chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
