#!/bin/bash

RPM_PATH="/rpms";

createrepo /rpms/RPMS/noarch/

yum install -y --disableexcludes=Tuleap tuleap-documentation && yum install -y --enablerepo=rpmforge-extras tuleap-all

/usr/share/tuleap-install/setup.sh

/etc/init.d/tuleap start
exec bash
