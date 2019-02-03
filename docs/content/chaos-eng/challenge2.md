+++
title = "Challenge 2"
weight = 10
+++

### Use the log output to keep track of kube-monkey's actions

Identify the kube-monkey processes in your cluster and view their logs to get a sense of their status and activity.

1. Run the following commands:
  - `kubectl get pods -n kube-system`
  - `kubectl logs -f kube-monkey-<#> -n kube-system`
  
  or 
  
  - `kubectl logs deploy/kube-monkey -n kube-system`
  
#### In the logs, find the value to complete the following log output line: 
  `Status Update: Generating next schedule in ?? sec`
