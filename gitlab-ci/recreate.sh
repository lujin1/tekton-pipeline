yamls=`ls|grep yaml |xargs`
for y in $yamls;
do
  kubectl delete -f $y -n tekton-pipelines
  kubectl create -f $y -n tekton-pipelines
done
