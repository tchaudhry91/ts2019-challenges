+++
title = "Challenge 1"
weight = 5
+++

Challenge 0

### Hello World.

### Verify the number of minons in the Salt Stack farm

```
docker exec salt-master salt "*" test.ping
```

### Lets Try one more thing. Who all are running the show in the farm minions?


```
docker exec salt-master salt "*" cmd.run "whoami"
```

So we learnt how salt provides an easy command line interface to query any information from multiple servers(termed minions). Lets begin the real challenge.
