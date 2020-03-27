#!/bin/sh

namespace=$1
COMPLETIONTIME=$2
echo "RUN: delete pipelineruns starting"
pipelineruns=`kubectl get pipelineruns -n $namespace |grep -v NAME|awk '{if ($5 ~ /^'$COMPLETIONTIME'/) print $1}'|xargs`
if [ "$pipelineruns" ];then
    kubectl delete pipelineruns $pipelineruns -n $namespace
else
    echo "RUN: delete completed: no pipelineruns COMPLETIONTIME ~" $COMPLETIONTIME
fi