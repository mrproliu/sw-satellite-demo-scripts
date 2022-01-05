source env.sh

# Create GKE cluster
gcloud container clusters create "$CLUSTER_NAME" \
  --project "$GCP_PROJECT" \
  --zone "$GCP_REGION" \
  --cluster-version latest \
  --machine-type e2-standard-4 \
  --num-nodes 3 \
  --enable-network-policy

# Configure the GKE cluster credentials in the local machine
gcloud container clusters get-credentials "$CLUSTER_NAME" --zone "$GCP_REGION" --project "$GCP_PROJECT"
