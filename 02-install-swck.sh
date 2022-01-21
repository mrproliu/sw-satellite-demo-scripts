source env.sh

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.yaml
kubectl -n cert-manager wait --for=condition=Ready pods --all --timeout=1200s

# Deploy SWCK
mkdir -p skywalking-swck && cd skywalking-swck
wget https://dlcdn.apache.org/skywalking/swck/0.6.1/skywalking-swck-0.6.1-bin.tgz
tar -zxvf skywalking-swck-0.6.1-bin.tgz
cd config
kubectl apply -f operator-bundle.yaml

kubectl -n skywalking-swck-system wait --for=condition=Ready pods --all --timeout=1200s