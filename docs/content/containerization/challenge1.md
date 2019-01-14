+++
title = "Challenge 1"
weight = 5
+++

### Containerize a stand-alone service

The first service that the team would like you to manage is a simple web server. It just serves a
bundle of HTML, CSS and Javascript to the browser, and has no other state to manage. You'd like
to keep it simple.

#### 1. Writing YAML

In Kubernetes land, an operator, like you, authors descriptions of jobs. These jobs are usually
specied as a conguration for various "controllers". These controllers create and manage the
lifecycle of containers in dierent ways.
For a stateless microservice, the most appropriate controller is a Deployment . We deploy our
image using that by saving the following YAML into the file `deployment.yaml`.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  selector:
    matchLabels:
      2name: frontend
  template:
    metadata:
      labels:
        name: frontend
  spec:
    containers:
    - name: frontend
      image: saykumar/ts2019:s1
      resources:
        limits:
          memory: 70Mi
        requests:
          cpu: 100m
          memory: 45Mi
```

#### 2. Deploying with Kubectl

  - `kubectl apply -f deployment.yaml`

Verify the status with `kubectl get pods`:
```bash
NAME                        READY   STATUS      RESTARTS    AGE
frontend-6f95c57495-7ppsf   1/1     Running     0           3m
```

This is great! The container is running. But how do we access it?

#### 3. Create a Service

A "service" absraction in k8s is an in-cluster software load-balancer. This can be pointed to one
or many pods by specifying various selectors . We create one as below to point to the pod we
deployed in the previous step.

Save the YAML below to a file called `service.yaml`:

```yaml
kind: Service
apiVersion: v1
metadata:
  name: frontend
spec:
  type: LoadBalancer
  selector:
    name: frontend
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
```

Submit this to the cluster:

  - `kubectl apply -f service.yaml`

Verify using `kubectl get services`. Output should be similar to:
```bash
NAME        TYPE            CLUSTER-IP      EXTERNAL-IP     PORT(S)         AGE
frontend    LoadBalancer    10.107.102.107  localhost       8080:31425/TCP  25s
kubernetes  ClusterIP       10.96.0.1       <none>          443/TCP         5h
```

#### 4. Accessing the Service

In another terminal window, run this to verify that you can access the service: `watch -d curl -s http://localhost:8080`
You should see an output like this:
```bash
Welcome to TS2019!
Served from frontend-6f95c57495-7ppsf
```
Congratulations, you've deployed a container and exposed it outside of the cluster!
Keep this output running while you move on to the next step.

#### 5. Scale the service

A single instance of the microservice isn't very reliable. Maybe we should run more than 1, how
about 3? With k8s deployments, this is very easy to automate.
Edit the `deployment.yaml` file as shown below. Notice the `replicas: 3` line.

```yaml
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
        image: saykumar/ts2019:s1
        resources:
          limits:
            memory: 70Mi
          requests:
            cpu: 100m
            memory: 45Mi
```

Deploy this update in-place with `kubectl apply -f deployment.yaml`.

Verify the scale-up with the output of `kubectl get pods`. Two new containers will have started up. The output should look similar to:
```bash
NAME                            READY   STATUS      RESTARTS    AGE
pod/frontend-6f95c57495-6ghkk   1/1     Running     0           1m
pod/frontend-6f95c57495-7ppsf   1/1     Running     0           32m
pod/frontend-6f95c57495-xpj5f   1/1     Running     0           1m
```

Notice the output of the curl command. The hostname in the line `Served from ...` will keep changing. By default, k8s does round-robin load-balancing. In 3 simple steps, you now have a highly available service running on Kubernetes! Nicely done!

Keep the outputs running while you move to the next step.

#### 6. Update deployment

So your front-end engineers just rushed in, and they have an important update that you need to deploy. They've built the Docker image and it's called `saykumar/ts2019:s4`. They seem to be in quite a rush.

At the same time, there's a lot of traffic to the cluster, and you can't afford any interruption to
the service.

Well, Kubernetes has you covered. Remember we mentioned that controllers like `deployments`
manage the lifecycle of containers. Well, upgrade is a crucial part of that lifecyle and Kubernetes
has great defaults for handling resilient updates.

Open up `deployment.yaml` in your text editor and edit it as shown:

```yaml
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
        image: saykumar/ts2019:s4
        imagePullPolicy: Always
        resources:
          limits:
            memory: 70Mi
          requests:
            cpu: 100m
            memory: 45Mi
```

Submit it to the cluster as `kubectl apply -f deployment.yaml`.

Notice how the output of `curl` keeps changing. Kubernetes phases out instances of the old
image and brings up new images. During this entire period, no service interruption occurs.
Your code will be seen in the output of `curl`.

#### 7. Conclusion

And that brings you to the end of this hands on session - you learnt how to deploy a container,
expose it outside the cluster, scale it up and upgrade it. All without any impact to the service
availability.

Clean up your cluster by doing these steps:

  - `kubectl delete -f deployment.yaml`
  - `kubectl delete -f service.yaml`

