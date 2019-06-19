#!/usr/bin/env bash


iplist=(
k8s
k8s1
k8s2
k8s3
)
function fun
{
    ssh $1 " mount 172.16.50.146:/nfs-share  /nfs-local && df -h"
}
for ip in ${iplist[@]}
do
    fun $ip
    echo _____
done
