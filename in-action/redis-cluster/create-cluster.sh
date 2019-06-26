#!/usr/bin/env bash

kubectl exec -it redis-stateful-set-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')

