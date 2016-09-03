#!/bin/bash

export APPDATA_DATABASE_HOST="127.0.0.1"
export APPDATA_DATABASE_PASSWORD="p@sSw0rd"
export APPDATA_DATABASE_PORT="3306"
export APPDATA_DATABASE_USERNAME="remco"
export APPDATA_DATABASE_APP1="10.0.1.10:8080"
export APPDATA_DATABASE_APP2="20.0.1.11:8080"

remco --config integration/env/env.toml
cmp /tmp/remco-basic-test.conf ./integration/config/test.config || cat /tmp/remco-basic-test.conf
