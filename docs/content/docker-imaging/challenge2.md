+++
title = "Challenge 2"
weight = 10
+++

### Setup environment
```
ssh devops
cd /vagrant/challanges/devops/docker-imaging/intermediate-challenge-1
cd /vagrant/challanges/devops/docker-imaging/setup/pypi/ && ./start.sh && cd -
source /vagrant/challanges/devops/docker-imaging/enable_validator.sh
./start.sh
```

### Managing Docker image layers

So, you built a working docker image in the previous challenge. Some random people on the internet complained about inefficient layer management and what not. But what do they know!? The container works!
Meanwhile, there's been a discovery. We are not alone. Aliens have been found. And our "Hello World" is no longer appropriate. The developers have scrammed and pushed out a patch to make the app say "Hello Worlds!" instead.
They want you to rebuild and redeploy the container.
Easy stuff.

docker build...docker run...

#### Step 1: Retry the docker build command.
In the `/vagrant/challanges/devops/docker-imaging/intermediate-challenge-1/python-hello-worlds` directory, try:

`docker build -t "hello-worlds-python" .`

The rebuild goes as expected.

#### Step 2: The dev made a typo.

The app says 'Hello Wrlds'. Grab an editor, fix this in the `hello-worlds.py` and rebuild the image.

`docker build -t "hello-worlds-python" .`

The app builds successfully again. However, it gathered and installed all the dependencies again. This is frustrating, you don't want to have to do this every time you fix typos! Maybe the guys on the internet had a point. Let's improve our image layers.

So you read up on docker image layers. Apparently, each instruction in the Dockerfile (`FROM`, `ADD`, `COPY`, `RUN`) adds a new 'layer'. As long as the instruction or the file in the instruction (in case of `COPY`/`ADD`) doesn't change, there is no need to create that layer again. But, if it DOES change, all the layers created after the instruction need to be rebuilt as well.

#### Step 3: Think

Our `requirements.txt` never changes. Only our `hello-worlds.py` changes. Is there a way we could put these in separate layers, so we wouldn't have to keep gathering requirements everytime we changed code?? You wonder.

#### TASK: Change the Dockerfile so that subsequent changes to the code are built quickly and do not have to gather the requirements every time!

HINT: Try copying your app into the container in 2 different steps.

#### FLAG:

`tsvalidator validate docker chal2 --image hello-worlds-python`

NOTE: If you didn't complete this step in the first challenge, enable the validator now : `source /vagrant/challanges/devops/docker-imaging/enable_validator.sh`


<a href="https://ctf.ts2019.adobe.com/challenges#DockerImaging2" target="_blank">Link to enter flag </a> 