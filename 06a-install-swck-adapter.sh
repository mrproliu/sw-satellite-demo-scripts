source env.sh

cd skywalking-swck
export ADAPTER_IMG=gcr.io/$GCP_PROJECT/adapter
make -C adapter docker-build
docker push gcr.io/$GCP_PROJECT/adapter
make -C adapter deploy

kubectl -n skywalking-custom-metrics-system  wait --for=condition=Ready pods --all --timeout=1200s