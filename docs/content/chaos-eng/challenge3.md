+++
title = "Challenge 3"
weight = 15
+++

### Increase the number of pods being terminated

Update the configuration to kill two pods instead of just one. As this is an expert challenge, we're going to expect you to poke through the files in Challenge 1 and figure out what config entry needs to be changed.

https://github.com/asobti/kube-monkey#opting-in-to-chaos

1. Edit the correct yaml file, and replace the app
2. Verify the setting was updated
  - `kubectl describe -f _____.yaml`
3. Verify that 2 pods are being terminated instead of 1

#### What is the value changed?
Provide the answer in the form: _**`key: "value"`**_
