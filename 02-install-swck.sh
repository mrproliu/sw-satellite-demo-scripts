source env.sh

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.yaml

# Clone skywalking-swck
git clone https://github.com/apache/skywalking-swck
git reset --hard 39b0e11e2e24eee6153141f0b88bd2716906c8fd
cd skywalking-swck

export OPERATOR_IMG=gcr.io/$GCP_PROJECT/operator
make -C operator docker-build
docker push gcr.io/$GCP_PROJECT/operator
make -C operator install
make -C operator deploy

kubectl -n skywalking-swck-system  wait --for=condition=Ready pods --all --timeout=1200s