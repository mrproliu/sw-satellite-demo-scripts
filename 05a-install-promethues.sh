source env.sh

# Install prometheus
wget -O kube-prometheus-0.10.0.tar.gz https://github.com/prometheus-operator/kube-prometheus/archive/refs/tags/v0.10.0.tar.gz
tar -zxvf kube-prometheus-0.10.0.tar.gz && cd kube-prometheus-0.10.0
kubectl apply --server-side -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl apply -f manifests/

kubectl -n monitoring wait --for=condition=Ready pods --all --timeout=1200s
