+++
title = "Challenge 2"
weight = 10
+++

### Exposing multiple HTTP Microservices with an L7 proxy (Ingress)

The team is back with two services, which they want served from the same IP. Usually, we'd reach for an L7 proxy like Nginx to help us out. We are going to do the same with community-developed integrations between Nginx and Kubernetes. An Ingress rule is essentially like writing a reverse proxy rule in Nginx configuration. Kubernetes has standardized this syntax as "Ingress Rules".

The developer team wants to deploy the image `saykumar/ts2019:l2s1` under `/hello` and `saykumar/ts2019:l2s2` under `/secondservice`. Can you help?

#### 1. Set up nginx

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml`
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/baremetal/service-nodeport.yaml`

Verify by opening your favorite browser and going to `http://localhost`
If Nginx started successfully, you'll receive a `404` from Nginx as below:

```bash
404 Not Found

nginx/1.15.6
```

So nginx is up, but it's not serving any apps. Let's change that!

#### 2. Connect first application to Nginx

First, let's deploy the container with the first image. Open up your editor and create a file `deployment-app1.yaml` as shown below.

If you've completed Level 1 of this section, then this should be simple to follow.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app1
spec:
  replicas: 2
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
        image: saykumar/ts2019:l2s1
        imagePullPolicy: Always
        resources:
          limits:
            memory: 70Mi
          requests:
            cpu: 100m
            memory: 45Mi
```

Watch the output of kubectl get pods to know when the containers are ready.

Now that we have the container up, we need Nginx to point to these containers. We can do that by creating a service and then creating an Ingress rule to point to this service.

Create a file `service-app1.yaml` as shown below:

```yaml
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
```
Note that we no longer use `type: LoadBalancer`, but specify a type which is only accessible from
within the cluster,`type: ClusterIP`. This is because we won't expose the application directly to
the internet, but via Nginx.

Now we come to the ingress rule. Write this into a file `ingress-app1.yaml`:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: app1
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - http:
        paths:
        - path: /hello
          backend:
            serviceName: app1
            servicePort: 8080
```

This instructs Nginx (which is an `ingress controller` in k8s terminology) to point requests
to `/hello` to the service `app1` that we defined above.

Once this is done, visit `https://localhost/hello` in your browser. You'll get a warning for a self-signed certificate. Accept that and continue. You should see one half of the page loads successfully, but there's still a 404 error on the bottom half. That's because the second app is still not deployed and wired up with an ingress rule.

Let's do that now.

#### 3. Connect the second application to Nginx

Open up your editor and create a file `deployment-app2.yaml` as shown below.

```yaml
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
        image: saykumar/ts2019:l2s2
        imagePullPolicy: Always
        resources:
          limits:
            memory: 70Mi
          requests:
            cpu: 100m
            memory: 45Mi
```

Watch the output of kubectl get pods to know when the containers are ready.

Create a file `service-app2.yaml` as shown below:

```yaml
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
```

Now we come to the ingress rule. Write this into a file `ingress-app2.yaml`:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: app2
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - http:
      paths:
      - path: /secondservice
        backend:
          serviceName: app2
          servicePort: 8080
```

This instructs Nginx (which is an `ingress controller` in k8s terminology) to point requests
to `/hello` to the service app2 that we defined above.

Once this is done, refresh your browser, and you should be able to see your challenge code to advance!

With these steps, you've now deployed two micro-services, served them on the same IP under two different HTTP paths. This has the beginnings of a web application, and you are growing fast as the DevOps support for the team! Congratualations!

#### Submit the code displayed at the end of the challenge.

