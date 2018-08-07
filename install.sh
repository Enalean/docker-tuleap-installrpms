#!/bin/bash
RPM_PATH="/rpms";

createrepo /rpms/RPMS/noarch/

yum install -y --disableexcludes=Tuleap tuleap-documentation && yum install -y tuleap-all

/usr/share/tuleap-install/setup.sh --disable-domain-name-check --sys-default-domain='tuleap.test' --sys-org-name='TuleapTest' --sys-long-org-name='TuleapTest'
