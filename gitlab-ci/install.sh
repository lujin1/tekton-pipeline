gitlabUser=$1
gitlabPossword=$2
dockerUser=$3
dockerPassword=$4
gitlabToken=$5

kucectl apply -f https://github.com/tektoncd/pipeline/releases/download/v0.10.1/release.yaml
kubectl apply -f https://github.com/tektoncd/dashboard/releases/download/v0.5.2/tekton-dashboard-release.yaml
kubectl apply -f https://github.com/tektoncd/triggers/releases/download/v0.3.1/release.yaml

# create gitlab Secret
echo '''apiVersion: v1
kind: Secret
metadata:
  name: gitlab
  annotations:
    tekton.dev/git-0: https://github.com
type: kubernetes.io/basic-auth
stringData:
  username: $gitlabUser
  password: $gitlabPossword'''|kubectl -n tekton-pipelines apply -f -
  
# create gitlab Secret
echo '''apiVersion: v1
kind: Secret
metadata:
  name: docker
  annotations:
    tekton.dev/docker-0: https://harbor.arfa.wise-paas.com # Described below
type: kubernetes.io/basic-auth
stringData:
  username: $dockerUser
  password: $dockerPassword''' |kubectl -n tekton-pipelines apply -f -
 
# create ServiceAccount
echo '''apiVersion: v1
kind: ServiceAccount
metadata:
  name: tekton-pipeline
secrets:
  - name: docker
  - name: gitlab'''|kubectl -n tekton-pipelines apply -f - 
 
 kubectl create clusterrolebinding tekton-pipeline --clusterrole=cluster-admin --serviceaccount=tekton-pipelines:tekton-pipeline --namespace=tekton-pipelines 
 

