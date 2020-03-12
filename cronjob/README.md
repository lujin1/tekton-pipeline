# Cronjob for delete pod  

1. Create serviceaccount  
`kubectl create sa delete-pod`  
2. Rolebinding to delete-pod sa   
`kubectl create clusterrolebinding delete-pod --clusterrole=cluster-admin --serviceaccount=<yourNamespace>:delete-pod --namespace=<yourNamespace>`  
3. Create cronjob  
`kubectl create -f cronjob-delete-pod.yaml`  
> args 中,第二个参数是需要删除的 pod 关键字   
`args: ["/opt/delete-pod.sh","Evicted"]`
