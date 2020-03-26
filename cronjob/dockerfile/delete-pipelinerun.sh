#!/bin/sh

namespace=$1
COMPLETIONTIME=$2
echo "RUN: delete pipelineruns starting"
kubectl get pipelineruns -n $namespace |grep -v NAME|awk '{if ($5 ~ /^'$COMPLETIONTIME'/) print $1}'|xargs kubectl delete pipelineruns -n $namespace 2> /dev/null
if [ $? -eq 0 ]; then
    echo "RUN: delete completed"
else

    echo "RUN: delete completed: no pipelineruns COMPLETIONTIME ~" $COMPLETIONTIME
fi