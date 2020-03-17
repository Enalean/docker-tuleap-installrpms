#!/bin/bash
RPM_PATH="/rpms";

createrepo /rpms/RPMS/noarch/

yum install -y --disableexcludes=Tuleap tuleap-documentation && yum install -y tuleap-all tuleap-plugin-git-gitolite3

if [ "${DB}" = "mysql57" ]; then
    service rh-mysql57-mysqld start
    scl enable rh-mysql57 -- mysqladmin -uroot password welcome0

    /usr/share/tuleap-install/setup.sh --disable-domain-name-check --sys-default-domain='tuleap.test' --sys-org-name='TuleapTest' --sys-long-org-name='TuleapTest' --mysql-host=localhost --mysql-user=root --mysql-user-password=welcome0
else
    /usr/share/tuleap-install/setup.sh --disable-domain-name-check --sys-default-domain='tuleap.test' --sys-org-name='TuleapTest' --sys-long-org-name='TuleapTest'
fi
