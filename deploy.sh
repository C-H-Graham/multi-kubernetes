docker build -t jobothehobo/multi-client:latest -t jobothehobo/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jobothehobo/multi-server:latest -t jobothehobo/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jobothehobo/multi-worker:latest -t jobothehobo/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jobothehobo/multi-client:latest
docker push jobothehobo/multi-server:latest
docker push jobothehobo/multi-worker:latest

docker push jobothehobo/multi-client:$SHA
docker push jobothehobo/multi-server:$SHA
docker push jobothehobo/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jobothehobo/multi-server:$SHA
kubectl set image deployments/client-deployment client=jobothehobo/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jobothehobo/multi-worker:$SHA