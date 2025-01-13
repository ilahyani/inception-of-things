kubectl create namespace dev
kubectl apply -f app.yaml -n dev
kubectl wait --for=condition=Ready pods --all -n dev --timeout=300s
kubectl port-forward --address 0.0.0.0 svc/will42-service -n dev 8888:8888