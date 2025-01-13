kubectl create namespace argocd
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -n argocd
kubectl wait --for=condition=Ready pods --all -n argocd --timeout=300s
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d > passwd.txt
kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8080:80