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
FROM localhost:32000/alpine-curl-gzip
RUN curl -o access.log.gz http://172.17.0.1:32002/access.log.gz
RUN gzip -d access.log.gz
RUN cat access.log | cut -f 1 -d " " | sort | uniq > unique-access.log
RUN rm access.log
```
>
> I'm trying to gather the unique list of IPs from a very large apache log. While the unique list is very small, the final docker image is very large! I even used a small alpine base image!
> Can someone help me optimize this?

SETUP : Run the following command: `cd /vagrant/challanges/devops/docker-imaging/setup/filehost/ && ./start.sh && cd -`

TASK: Rewrite the above Dockerfile so that it still contains the `/unique-access.log` but is as small as possible. There are multiple ways to achieve this and we only care about the final result. You get credit as long as your final image is as small as it can be.

#### Run the following command to get your flag after you have created a new image < 10Mb
`tsvalidator validate docker chal4 --image {your-image-name}`

NOTE: If you didn't complete this step in the first challenge, enable the validator now : `source /vagrant/challanges/devops/docker-imaging/enable_validator.sh`
