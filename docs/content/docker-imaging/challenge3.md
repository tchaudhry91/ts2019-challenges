+++
title = "Challenge 3"
weight = 15
+++

### Optimizing container size

You fixed your layers! Yet, the internet backlash continues. Now, they're throwing around phrases like 'bloated image'...someone has even used the word 'fat'. Yet, you stay determined to make this work.

It's a hello-world app. What kind of bloat do they think is there??

#### Step 1: Step on the scale

Let's take a look, at how big the image actually is.

`docker images -a | grep hello`

This may be a bit different based on how you completed the last challenge's Dockerfile, but expect output something like this.

```bash
hello-worlds-python     latest  927fb8d8ac54    24 minutes ago  931MB
```

**NINE HUNDRED AND THIRTY ONE MEGABYTES.** You can wash your eyes all you want, but this number is correct.

#### Step 2: Examine the layers

You do some math. < 1KB of code. ~10Mb of requirement library. Hmm. Definitely != 900+ MB. What about the base image? That's also a layer. Perhaps that's where the bloat is? Let's take a look.

`docker images localhost:32000/python:3`

#### Step 3: Smaller alternatives

The previous step should have made it clear by now. You need to choose your `FROM` statement carefully. The system contains a couple of pre-baked images on your system that can be used instead of `localhost:32000/python:3`. Try them out with:

`docker pull localhost:32000/python:3-slim`

`docker pull localhost:32000/python:3-alpine`

After pulling the images, inspect them with the following command:

`docker images -a | grep python`


(NOTE: If you're following on at home, please look them up at `https://hub.docker.com/_/python/` instead.)

Edit your Dockerfile and rebuild your app with a slimmer docker base image and tag it `slim`:

`docker build -f Dockerfile -t "hello-worlds-python:slim" .`

Re-check the size of your image and post the output:

`docker images hello-worlds-python:slim`

#### FLAG:

`tsvalidator validate docker chal3 --image hello-worlds-python:slim`

NOTE: If you didn't complete this step in the first challenge, enable the validator now : `source /vagrant/challanges/devops/docker-imaging/enable_validator.sh`

