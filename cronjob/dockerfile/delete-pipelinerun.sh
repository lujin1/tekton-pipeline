#! /bin/sh

namespace=$1
COMPLETIONTIME=$2
kubectl get pipelineruns -n $namespace |grep -v NAME|awk '{if ($5 == '$COMPLETIONTIME') print $1}'|xargs kubectl delete pipelineruns -n $namespace
