#!/bin/sh

namespaces=`kubectl get ns |grep -v "NAME"|awk '{print $1}'|xargs`
for namespace in $namespaces;
do
    echo "namespace:$namespace, deleting $1 pod"
    pods=`kubectl get pod -n $namespace|grep $1|awk '{print $1}'|xargs`
    if [ "$pods" ];then
        kubectl delete pod $pods -n $namespace
    else
        echo "no $1 pod in $namespace"
    fi
done