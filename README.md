This repo contains the scripts that help to set up an experiment environment to test the solution of Apache SkyWalking + Apache SkyWalking Satellite + Envoy Access Log Service (ALS) for observability.

```text
.
|----- env.sh                               // Contains variables that will be used through the entire process, open and edit to your own scenario
|----- 00-create-cluster.sh                 // Create a GKE cluster, if you already have running cluster, this is optional
|----- 01-install-istio.sh                  // Install Istio, ALS enabled and sets the ALS address to Apache SkyWalking Satellite
|----- 02-install-swck.sh                   // Install SWCK and wait the operator starting finished
|----- 03-deploy-sw-with-satellite.sh       // Deploy SkyWalking components and Satellite
|----- 04-deploy-applications.sh            // Deploy Bookinfo application from Istio
|----- 05a-install-promethues.sh            // Install prometheus, grafana component
|----- 05b-add-monitor.sh                   // Add SkyWalking OAP metrics through Prometheus fetcher
|----- 06a-install-swck-adapter.sh          // Install SWCK metrics adapter for listen metrics from SkyWalking
|----- 06b-deploy-hpa.sh                    // Deploy HPA to monitor SkyWalking Satellite metrics for scaling
|----- resources
|----- |----- sw-components.yaml            // SkyWalking OAP, UI, Satellite components in SWCK CRD
|----- |----- otel-collector-oap.yaml       // OpenTelemetry Collector and monitor metrics from OAP
|----- |----- monitor-sw.yaml               // Monitor SkyWalking metrics
|----- |----- satellite-hpa.yaml            // Satellite HPA resource
```