# Monitoring Challenges
 
Infrastructure and services have evolved very rapidly over the last decade. Hulking servers are being phased out in favor of clusters. Microservices are being favored over monoliths.
This brings new challenges to traditional operational tasks such as monitoring as well. Prometheus is a monitoring system built keeping all these challenges in mind.

## Challenge 1

Your company has developed two versions of a hashing service. Both teams claim that their service performs better but have no stats to back this claim. You have been asked to help out with a comparison.
Here are the things provided:

- HTTP backed Hashing Service (2 variations)
  - hasher-red
  - hasher-blue

    Both these variations export their functioning metrics at `/metrics`
- A load testing client:
    This client keeps serially throwing requests at the given hashing service.
- A Prometheus Instance:
    To collect metrics from the given services.

Sources: challenges/challenge1

Let's get started with deployments:
- `ssh devops`
- `cd /vagrant/challanges/devops/monitoring`
- Deploy the 2 hashing services with the following kubernetes yml:
    `kubectl --namespace=ts2019-mon create -f deploy-hashers.yml`
    These 2 services are already exporting prometheus metrics at the /metrics endpoint.
- Create a prometheus config to gather metrics from these two endpoints. A sample config has been provided under _config/prometheus.yml_
    The sample config has already been asked to scrape from _hasher-blue-svc_. You need to add a second _job_ to scrape from _hasher-red-svc_ as well.
- Once the changes have been made, run the following command to put the config on the cluster:
    `kubectl --namespace=ts2019-mon create configmap prom-config --from-file config/prometheus.yml`
- Deploy the prometheus-instance and service to view it in your browser:
    `kubectl --namespace=ts2019-mon create -f deploy-prometheus.yml`
    Point your browser to **http://192.168.33.10:30001** and you should see your prometheus instance!
- Verify that you can see **both** the services under _status/targets_. Both services should be 'UP' and working.
- Now, we'll actually make the services work and prove themselves. Deploy the load testers:
    `kubectl --namespace=ts2019-mon create -f deploy-load-testers.yml`
    This should spin up 2 load creating pods that will constantly hit our hashing endpoints!

The setup is now complete and you can now explore what prometheus can offer us in such a scenario. Give this a couple of minutes for the metrics to take shape.
Head over to **http://192.168.33.10:30001/graph** and explore the available metrics! The interesting ones for the challenge with begin with the prefix **microservices**.

You need to find out the following answers from within the prometheus console:

- Which service is performing faster? (blue/red)
- By how much is it out-performing the other service?
    e.g blue service is taking 50ms per request whereas red service is taking 500ms. Blue = 10times faster than red
    Round to nearest integer!
- What is the 99 quantile latency for the faster service? (metrics exposed in seconds)

The flag is the combination of the 3 answers above separated by hyphens.

e.g :
FLAG = **red-15-0.02**

**Cleanup**
To cleanup your deployments, simply run:
`kubectl delete ns ts2019-mon`
