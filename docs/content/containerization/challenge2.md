+++
title = "Challenge 2"
weight = 10
+++

# Exposing multiple HTTP Microservices with an L7 proxy


## Getting started


### Challenge

 The team is back with two services, which they want served from the same IP.
Usually, we'd reach for an L7 proxy like Nginx to help us out. We are going to
do the same with community-developed integrations between Nginx and Kubernetes.
An Ingress rule is essentially like writing a reverse proxy rule in Nginx
configuration. Kubernetes has standardized this syntax as "Ingress Rules".

The developr team wants to deploy the image `localhost:3200/saykumar/ts2019:l2s1` under
`/hello` and `localhost:32000/saykumar/ts2019:l2s2` under `/secondservice`. Can you help?


### Verify pre-requisites

-   SSH into your Vagrant environment with `vagrant ssh` if not already in that
    environment
-   Verify Kubernetes is working with

`kubectl get nodes`
If you don't see an output similar to this, please get in touch with a volunteer.

    NAME            STATUS   ROLES    AGE   VERSION
    ubuntu-bionic   Ready    <none>   19h   v1.12.4

-   Make a folder for this challenge, `mkdir ch2`
-   Get into that folder `cd ch2`


## Step 1

-   The Kubernetes cluster created for you already has an Nginx based ingress
    controller already running.
-   Verify if an ingress controller is running and accessible from your
    browser by pointing it to <http://192.168.33.10/>. If you get a `502 Bad
          Gateway` served by `nginx/1.13.xx`, this is fine and proceed to the next
    step. Otherwise, get in touch with a volunteer.
-   So nginx is up, but it's not serving any apps. Let's change that!


## Step 2

First, let's deploy the container with the first image. Open up your editor and
create a file `deployment-app1.yaml` as shown below.

If you've completed the first challenge, then this should be simple to follow.

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: app1
    spec:
      selector:
        matchLabels:
          name: app1
      template:
        metadata:
          labels:
            name: app1
        spec:
          containers:
          - name: app1
            image: localhost:32000/saykumar/ts2019:l2s1

Watch the output of `kubectl get pods` to know when the containers are ready.

Now that we have the container up, we need Nginx to point to these containers.
We can do that by creating a `Service` and then creating an `Ingress` rule to
point to this `Service`.

Create a file `service-app1.yaml` as shown below:

    kind: Service
    apiVersion: v1
    metadata:
      name: app1
    spec:
      type: ClusterIP
      selector:
        name: app1
      ports:
      - protocol: TCP
        port: 8080
        targetPort: 8080

Note that we no longer use `type: LoadBalancer` or `type: NodePort`, but
specify a type which is only accessible from within the cluster, `type:
   ClusterIP`. This is because we won't expose the application directly to the
internet, but via Nginx. Be careful of service definitions which may have a
`LoadBalancer` type hanging around &#x2013; it could be a big security issue!

Now we come to the ingress rule. Write this into a file `ingress-app1.yaml`:

    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: app1
    spec:
      rules:
      - http:
          paths:
          - path: /hello
            backend:
              serviceName: app1
              servicePort: 8080

This instructs Nginx (which is an `ingress controller` in k8s terminology) to
point requests to `/hello` to the service `app1` that we defined above.

Once this is done, visit <https://192.168.33.10/hello> in your browser.

You'll get a warning for a self-signed certificate. Accept that and continue.

If all goes to plan, you should see something as shown below:

![img](/containerization/l2s2.png)

That's great, you've deployed the first app. But there's a 502 error on the
page. That's because the second app is still not deployed and wired up with an
ingress rule.

Let's do that now.


## Step 3

Open up your editor and create a file `deployment-app2.yaml` as shown below.

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: app2
    spec:
      replicas: 2
      selector:
        matchLabels:
          name: app2
      template:
        metadata:
          labels:
            name: app2
        spec:
          containers:
          - name: app2
            image: localhost:32000/saykumar/ts2019:l2s2

Watch the output of `kubectl get pods` to know when the containers are ready.

Create a file `service-app2.yaml` as shown below:

    kind: Service
    apiVersion: v1
    metadata:
      name: app2
    spec:
      type: ClusterIP
      selector:
        name: app2
      ports:
      - protocol: TCP
        port: 8080
        targetPort: 8080

Now we come to the ingress rule. Write this into a file `ingress-app2.yaml`:

    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: app2
    spec:
      rules:
      - http:
          paths:
          - path: /secondservice
            backend:
              serviceName: app2
              servicePort: 8080

This instructs Nginx (which is an `ingress controller` in k8s terminology) to
point requests to `/hello` to the service `app2` that we defined above.

Once this is done, refresh your browser, and you should be able to scroll the
new frame and see your code to advance!

![img](/containerization/l2s3.png)


## Conclusion

With these steps, you've now deployed 2 micro-services, served them on the same
IP under 2 different HTTP paths. This has the beginnings of a web application,
and you are growing fast as the DevOps support for the team! Congratualations!

Clean up your Kubernetes cluster by running `kubectl delete -f .` in the folder.
This will delete resources corresponding to every YAML file in the current
directory.
