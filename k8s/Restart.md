# Process for restarting 
------------------

#stop minikube
minikube stop

## if you need to free resources
minikube delete

## start minikube (adjust settings as needed)
minikube start  --vm-driver=hyperv --cpus 4 --memory 4096

##create secret(s)
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf