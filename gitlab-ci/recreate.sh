yamls=`ls|grep yaml |xargs`
for y in $yamls;
do
  kubectl delete -f $y
  kubectl create -f $y
done