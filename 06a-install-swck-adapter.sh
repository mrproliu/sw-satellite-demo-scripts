source env.sh

kubectl apply -f skywalking-swck/config/adapter-bundle.yaml

kubectl -n skywalking-custom-metrics-system  wait --for=condition=Ready pods --all --timeout=1200s