+++
title = "Challenge 1"
weight = 5
+++

### Hello World
First a little bit of setup, run the following command to get a local pypi server that will serve dependencies for our app:
`cd /vagrant/challanges/devops/docker-imaging/setup/pypi/ && ./start.sh && cd -`

And enable the validator : `source /vagrant/challanges/devops/docker-imaging/enable_validator.sh`

Now, let's dockerize a hello-world app! Grab the python-hello-world repository and try running the python example in it.


```bash
pip3 install --index http://172.17.0.1:32001/simple --trusted-host 172.17.0.1 -r requirements.txt
python3 hello-world.py
```
(yes, 4 years on a rock and tutorials still do 'hello-world', disappointing)


#### Use a text editor and create a file called 'Dockerfile' in the repo root.

`vim Dockerfile`

Every Dockerfile must start with a `FROM` statement. This signifies the beginning point for an image. Almost always, we are building on top of something. Our app is python. So, let's grab a python based image to start from:

`FROM localhost:32000/python:3`

So, we already have a base image with everything python needs to run in it. Let's `COPY` our super fancy code to it.

`COPY . .`

What's left? We have the interpreter, we have the code. Let's `RUN` the dependency gathering.
(Note: This app doesn't really need the dependency, but we've put it in here to explain the RUN command)

`RUN pip --index http://172.17.0.1:32001/simple --trusted-host 172.17.0.1 -r requirements.txt`

Now, tell the container what `COMMAND` to run when it's started.

`CMD python hello-world.py`

Here's what the final Dockerfile should look like!

```Docker
FROM localhost:32000/python:3
COPY . .
RUN pip install -r requirements.txt
CMD python hello-world.py
```

`BUILD` out your image using this Dockerfile:

`docker build -t "hello-world-python" .`

Note: The '.' at the end is important. It signifies the build-context directory. So assuming the code is in your working directory, use the period to tell docker to look in this directory.

If you completed the above step, you should now be ready to `RUN` your container!

`docker run -it --rm hello-world-python`

And viola,  "Hello, World" from a container!
Notice the difference in the output when running inside a container?


#### Run the following command to get your flag after you have executed your docker build instruction!

`tsvalidator validate docker chal1 --image hello-world-python`
