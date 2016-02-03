#!/bin/bash

/install.sh

timeout 20s /etc/init.d/tuleap start
curl --insecure --output /output/index.html https://127.0.0.1/
