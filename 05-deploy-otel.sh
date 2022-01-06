source env.sh

kubectl apply -f resources/otel-collector-oap.yaml

kubectl -n skywalking-system wait --for=condition=Ready pods --all --timeout=1200s