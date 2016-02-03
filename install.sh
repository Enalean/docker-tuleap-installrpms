#!/bin/bash
RPM_PATH="/rpms";

createrepo /rpms/RPMS/noarch/

yum install -y --disableexcludes=Tuleap tuleap-documentation && yum install -y --enablerepo=rpmforge-extras tuleap-all

timeout 2m /usr/share/tuleap-install/setup.sh --disable-selinux --sys-default-domain='tuleap.test' --sys-org-name='TuleapTest' --sys-long-org-name='TuleapTest'
