Story:
Container, docker, orchestrator, swarms, clusters, kubernetes.....
Hello and welcome! You've spent a nice 4 year vacation on a rock. Upon your return, all you can read on the internet are those words above.
You feel the urge to get started on these to be able to ridicule HackerNews again. Docker seems like a good starting point. You've packaged applications before, let's try packaging one docker.

Tools:
docker
text editor

Hands-on:

- Let's dockerize a hello-world app! Grab the python-hello-world repository and try running the python example in it.
  `pip install -r requirements.txt`
  `python hello-world.py`
(yes, 4 years on a rock and tutorials still do 'hello-world', disappointing)

- Let's write a simple `Dockerfile` to package it as a dockerimage 

- Use a text editor and create a file called 'Dockerfile' in the repo root.
  `vim Dockerfile`

- Every Dockerfile must start with a `FROM` statement. This signifies the beginning point for an image. Almost always, we are building on top of something. Our app is python. So, let's grab a python based image to start from:
  `FROM localhost:32000/python:3`

- So, we already have a base image with everything python needs to run in it. Let's `COPY` our super fancy code to it.
  `COPY . .`

- What's left? We have the interpreter, we have the code. Let's `RUN` the dependecy gathering.
  (Note: This app doesn't really need the dependency, but we've put it in here to explain the RUN command)
  `RUN pip install -r requirements.txt`

- Now, tell the container what `COMMAND` to run when it's started.
  `CMD python hello-world.py`

- Here's what the final Dockerfile should look like!
```
FROM localhost:32000/python:3

COPY . .
RUN pip install -r requirements.txt
CMD python hello-world.py
```

- `BUILD` out your image using this Dockerfile:
  `docker build -t "hello-world-python" .`
  Note: The '.' at the end is important signified the build-context directory. So assuming the code is in your working directory, use the period to tell docker to look in this directory.

- If you completed the above step, you should now be ready to `RUN` your container!
  `docker run -it --rm hello-world-python:latest`

And voila! Hello World from a container!
Notice the difference in the output when running inside a container? 

