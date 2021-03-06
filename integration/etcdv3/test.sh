#!/bin/bash

export ETCDCTL_API=3

etcdctl --endpoints=127.0.0.1:2379 put /appdata/database/host 127.0.0.1
etcdctl --endpoints=127.0.0.1:2379 put /appdata/database/password p@sSw0rd
etcdctl --endpoints=127.0.0.1:2379 put /appdata/database/port 3306
etcdctl --endpoints=127.0.0.1:2379 put /appdata/database/username remco
etcdctl --endpoints=127.0.0.1:2379 put /appdata/upstream/app1 10.0.1.10:8080
etcdctl --endpoints=127.0.0.1:2379 put /appdata/upstream/app2 10.0.1.11:8080

remco --config integration/etcdv3/etcd.toml
cat /tmp/remco-basic-test-etcdv3.conf
