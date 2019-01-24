+++
title = "Challenge 1"
weight = 5
+++

# A Stateless Microservice


## Pre-requisites


### Story

The first service that the team would like you to manage is a simple web server.
It just serves a bundle of HTML, CSS and Javascript to the browser, and has no
other state to manage. You'd like to keep it simple.


### Verify pre-requisites

-   SSH into your  environment with `ssh techops` if not already in that
    environment
-   Verify Kubernetes is working with

`kubectl get nodes`
If you don't see an output similar to this, please get in touch with a volunteer.

    NAME            STATUS   ROLES    AGE   VERSION
    ubuntu-bionic   Ready    <none>   19h   v1.12.4

-   Make a folder for this challenge, `mkdir ch1`
-   Get into that folder `cd ch1`


## Step 1


### Writing YAML

In Kubernetes land, an operator, like you, authors descriptions of jobs. These
jobs are usually specified as a configuration for various "controllers". These controllers
create and manage the lifecycle of containers in different ways.

For a stateless microservice, the most appropriate controller is a `Deployment`. We
deploy our image using that by saving the following YAML into a file `deployment.yaml`.

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: frontend
    spec:
      selector:
        matchLabels:
          name: frontend
      template:
        metadata:
          labels:
            name: frontend
        spec:
          containers:
          - name: frontend
            image: localhost:32000/saykumar/ts2019:s1


### Deploying with Kubectl

`kubectl apply -f deployment.yaml`

Verify with `kubectl get pods`. Don't fret the specific hashes / numbers, the
output should look roughly like this below:

    NAME                                      READY   STATUS    RESTARTS   AGE
    default-http-backend-6dd45c666b-n56ns     1/1     Running   1          19h
    frontend-5487fd9489-xn8gm                 1/1     Running   0          5s
    nginx-ingress-microk8s-controller-64mdg   1/1     Running   1          19h

The entry starting with \`frontend-&#x2026;\` is the container corresponding to the
YAML that you just authored. Once it's running, your container is up and
running.

This is great, the container is running. But how do we access it?


## Step 2


### Create a Service

A "service" absraction in k8s is an in-cluster software load-balancer. This
can be pointed to one or many pods by specifying various `selectors`. We create
one as below to point to the `pod` we deployed in the previous step.

Save the YAML belowe to a file called `service.yaml`

    kind: Service
    apiVersion: v1
    metadata:
      name: frontend
    spec:
      type: NodePort
      selector:
        name: frontend
      ports:
      - protocol: TCP
        port: 8080
        targetPort: 8080

Then submit this to the cluster with `kubectl apply -f service.yaml`

Verify by `kubectl get services`. Output should be similar to, but not
identical to:

    NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
    default-http-backend   ClusterIP   10.152.183.47    <none>        80/TCP           19h
    frontend               NodePort    10.152.183.135   <none>        8080:32644/TCP   3m19s
    kubernetes             ClusterIP   10.152.183.1     <none>        443/TCP          19h


### Accessing the Service

The line of output corresponding to `frontend` has 2 numbers in the
`PORT(S)` column. In this specific case, the output is `8080:32644`. The
second port when you run the command could be different.

The service type we created was of type `NodePort`, which means that every
machine which is part of the Kubernetes cluster forwards traffic received on
port `32644` to the Kubernetes Service we just created.

In another terminal window, run this to verify that you can access the
service: `watch -d curl -s http://localhost:32644`. Of course, replace
`32644` with the port number that you saw in the output.

You should see an output like this:

    Welcome to TS2019!
    Served from frontend-6f95c57495-7ppsf

Congratulations, you've deployed a container and exposed it outside of the
cluster!

Keep this output running while you move on to the next step.


## Step 3

A single instance of the microservice isn't very reliable. Maybe we should run
more than 1, how about 3? With k8s deployments, this is very easy to automate.

Edit the `deployment.yaml` file as shown below. Notice the `replicas: 3` line.

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: frontend
    spec:
      replicas: 3
      selector:
        matchLabels:
          name: frontend
      template:
        metadata:
          labels:
            name: frontend
        spec:
          containers:
          - name: frontend
            image: localhost:32000/saykumar/ts2019:s1

Deploy this update in-place with `kubectl apply -f deployment.yaml`.

Verify the scale-up with the output of `kubectl get pods`. 2 new containers
would have been started up. The output should look similar to:

    NAME                                      READY   STATUS    RESTARTS   AGE
    default-http-backend-6dd45c666b-n56ns     1/1     Running   1          20h
    frontend-5487fd9489-hb6rc                 1/1     Running   0          13s
    frontend-5487fd9489-t9cfx                 1/1     Running   0          13s
    frontend-5487fd9489-xn8gm                 1/1     Running   0          45m
    nginx-ingress-microk8s-controller-64mdg   1/1     Running   1          20h

Notice the output of the `curl` command. The hostname in the line `Served from
   ...` will keep changing. By default, k8s does round-robin load-balancing. In 3 simple
steps, you now have a highly available service running on Kubernetes! Nicely done!

Keep the outputs running while you move to the next step.


## Step 4

So your front-end engineers just rushed in, and they have an important update
that you need to deploy. They've built the Docker image and it's called 
`saykumar/ts2019:s4`. They seem to be in quite a rush.

At the same time, there's a lot of traffic to the cluster, and you can't afford
any interruption to the service.

Well, Kubernetes has you covered. Remember we mentioned that controllers like 
`deployments` manage the lifecycle of containers. Well, upgrade is a crucial part of that
lifecyle and Kubernetes has great defaults for handling resilient updates.

Open up `deployment.yaml` in your text editor and edit it as shown:

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: frontend
    spec:
      replicas: 3
      selector:
        matchLabels:
          name: frontend
      template:
        metadata:
          labels:
            name: frontend
        spec:
          containers:
          - name: frontend
            image: localhost:32000/saykumar/ts2019:s4

And submit it to the cluster as `kubectl apply -f deployment.yaml`.

Notice how the output of `curl` keeps changing. Kubernetes phases out instances of the
old image and brings up new images. During this entire period, no service interruption 
occurs.

Your code will be seen in the output of `curl`. Enter that in the text box
for the challenge screen to complete this challenge!
