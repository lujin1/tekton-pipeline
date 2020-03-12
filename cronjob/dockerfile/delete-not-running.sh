type=$1
AGE=$2
namespaces=`kubectl get ns |grep -v "NAME"|awk '{print $1}'|xargs`
if [ "$type" = "delete" ]; then	
for namespace in $namespaces;
do
    if [ "$AGE" ];then
        echo "namespace:$namespace, deleting not runing pod and AGE == $2"
        kubectl get pod -n $namespace |grep -v NAME|grep -v Running |awk '{if ($5 == "12d") print $1}' |xargs 
    else
        echo "namespace:$namespace, deleting not runing pod"
        kubectl get pod -n $namespace
    fi

done
#kubectl get pod |grep -v NAME|grep -v Running |xargs kubectl delete pod
#kubectl get pod |grep -v NAME|grep -v Running |awk '{if ($5 == "20h") print $1}' |xargs
fi
