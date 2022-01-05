source env.sh

# Add Role of fetch endpoints from skywalking
kubectl apply -f resources/prometheus-clusterRole.yaml
# Add OAP monitor
kubectl apply -f resources/monitor-sw.yaml
