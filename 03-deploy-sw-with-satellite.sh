source env.sh

kubectl create namespace skywalking-system
kubectl label namespace skywalking-system swck-injection=enabled
# Deploy components
kubectl apply -f resources/sw-components.yaml

# Wait components ready
kubectl -n skywalking-system wait --for=condition=Ready pods --all --timeout=1200s