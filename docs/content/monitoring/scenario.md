+++
title = "Scenario"
weight = 1
+++

Your company has developed two versions of a hashing service. Both teams claim that their service performs better but have no stats to back this claim. You have been asked to help out with a comparison. Here are the things provided:

  - HTTP backed Hashing Service (2 variations)
    - *hasher-red*
    - *hasher-blue*

    Both these variations export their functioning metrics at `/metrics`

  - *load tester*: This client keeps serially throwing requests at the given hashing service.
  - *Prometheus instance*: To collect metrics from the given services.

