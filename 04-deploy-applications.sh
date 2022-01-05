source env.sh

kubectl apply -f https://raw.githubusercontent.com/istio/istio/$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl wait --for=condition=Ready pods --all --timeout=1200s