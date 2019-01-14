+++
title = "Challenge 4"
weight = 20
+++

### Shrink the docker, doctor.

You packaged a python application in a docker image. After some rough internet episodes, it now looks glorious, and you feel confident in your Dockerfile writing skills. You decide to share your knowledge and help people on StackOverflow.

Try your hand at this challenge:


> Hello, I have a Dockerfile in which I do the following things:
>
> ```Docker
FROM alpine
RUN apk add --update curl
RUN rm -rf /var/cache/apk/*
RUN curl -o access.log http://www.almhuette-raith.at/apache-log/access.log
*** Note to TechSummit Team: Replace with a custom localhost url once added to base build image ***
RUN cat access.log | cut -f 1 -d " " | sort | uniq > unique-access.log
RUN rm access.log
```
>
> I'm trying to gather the unique list of IPs from a very large apache log. While the unique list is very small, the final docker image is very large! I even used a small alpine base image!
> Can someone help me optimize this?

TASK: Rewrite the above Dockerfile so that it still contains the unique `access.log` but is as small as possible. There are multiple ways to achieve this and we only care about the final result. You get credit as long as your final image is as small as it can be.


HINTS:

  - multistage build
  - chained run statements
  - script into one layer
