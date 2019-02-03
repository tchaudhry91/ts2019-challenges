+++
title = "Challenge 2"
weight = 10
+++


Start environment

```
ssh devops
```


```
cd /vagrant/challanges/devops/ops-tools/
```

```
./start.sh
```

Login to the server

```
./login.sh
```

Challenge 2 - Find HTTP request header value

Someone wrote his first Hello World Python web client app and sending requests to the your webserver.
Find HTTP request header and value this client is sending using tcpdump tool.

Tcpdump is a common packet analyzer that runs under the command line. It allows the user to display TCP/IP and other packets being transmitted or received over a network to which the computer is attached. 


Hint: use `tcpdump -nn` with verbose to find header value

Your code will be seen in the output of `tcpdump` command. Use only header field value without fileld name.
