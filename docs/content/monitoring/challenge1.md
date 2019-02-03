+++
title = "Challenge 1"
weight = 5
+++

0. Start environment

```
ssh devops
cd /vagrant/challanges/devops/monitoring
./start.sh
```

1. Deploy the 2 hashing services with the following kubernetes yml:

  - `kubectl --namespace=ts2019-mon create -f deploy-hashers.yml`</br>
    These 2 services are already exporting prometheus metrics at the `/metrics` endpoint.

2. Create a prometheus config to gather metrics from these two endpoints. A sample config has been provided under `config/prometheus.yml`. The sample config has already been asked to scrape from both services.

3. Once the changes have been made, run the following command to put the config on the cluster:

  - `kubectl --namespace=ts2019-mon create configmap prom-config --from-file config/prometheus.yml`

4. Deploy the prometheus-instance and proxy it to view it in your browser:

  - `kubectl --namespace=ts2019-mon create -f deploy-prometheus.yml`

5. Point your browser to http://192.168.33.10:30001 and you should see your prometheus instance!

6. Verify that you can see both the services under status/targets. Both services should be 'UP' and working.

7. Now, we'll actually make the services work and prove themselves. Deploy the load testers:
  - `kubectl --namespace=ts2019-mon create -f deploy-load-testers.yml`</br>
  This should spin up 2 load creating pods that will constantly hit our hashing endpoints!

The setup is now complete and you can now explore what prometheus can offer us in such a scenario. Give this a couple of minutes for the metrics to take shape. Head over to http://192.168.33.10:30001/graph and explore the available metrics! The interesting ones for the challenge with begin with the prefix microservices.

#### The challenge answer is the combination of the 3 answers below separated by hyphens</br>(e.g : FLAG = `red-15-0.02`).

 - **Which service is performing faster? (blue/red)**
 - **By how much is it out-performing the other service?**</br>
e.g if blue = `50`ms, red = `500`ms, the answer = `500/50` = `10`.</br>
Round to nearest integer!
 - **What is the 99 quantile latency for the faster service? (metrics exposed in seconds)**
