source env.sh

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.yaml

# Clone skywalking-swck
git clone https://github.com/apache/skywalking-swck
git reset --hard 9e34be0a4bffaab8e09004ad4208133331970b50
cd skywalking-swck

export OPERATOR_IMG=gcr.io/$GCP_PROJECT/operator
make -C operator docker-build
docker push gcr.io/$GCP_PROJECT/operator
make -C operator install
make -C operator deploy

kubectl -n skywalking-swck-system  wait --for=condition=Ready pods --all --timeout=1200s