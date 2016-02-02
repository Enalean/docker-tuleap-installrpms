#!/bin/bash

/install.sh

/etc/init.d/tuleap start
exec curl --insecure --output /output/index.html https://127.0.0.1/
