#!/bin/bash

/install.sh

timeout 20s systemctl start tuleap
curl --insecure --output /output/index.html https://127.0.0.1/

timeout 20s journalctl --no-pager > /output/journalctl.log
