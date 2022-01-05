source env.sh

istioctl install -y --set profile=demo \
  --set meshConfig.enableEnvoyAccessLogService=true \
	--set meshConfig.defaultConfig.envoyAccessLogService.address=skywalking-system-satellite.skywalking-system:11800
kubectl label namespace default istio-injection=enabled