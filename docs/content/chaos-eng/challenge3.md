+++
title = "Challenge 3"
weight = 15
+++

### Increase the number of processes being terminated

Update the configuration to kill two processes instead of just one. As this is an expert challenge, we're going to expect you to poke through the files in Challenge 1 and figure out what config entry needs to be tweaked.

1. Edit file of your choice
2. Verify the setting was updated
  - `kubectl describe -f _____.yaml`
3. Verify the log output contains the following line:
  - `Status Update: 2 terminations scheduled today`

#### What config file and which value needed to be changed?
Provide the answer in the form: `filename/key: "value"`
