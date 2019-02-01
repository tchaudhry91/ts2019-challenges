+++
title = "Scenario"
weight = 1
+++

Adobe has just acquired a company and management wants to rebrand the website as Adobe's property. As the on-call engineer, you are called in the middle of night to make the code change and deploy it quickly to production.

To achieve this, you have to make some changes in code which begins a number of automated procedures:

1. Whenever you commit your code in git, a webhook will be triggered.
2. The webhook posts the change to Jenkins, triggering a build job.
3. The Jenkins job will pull the code change, compile it, and commit the output to a remote server as a versioned artifact.
4. Assuming we've an artifact... setup a post-build task which will download the artifact from the remote storage and will deploy the artifact to the web/application server.

Gone are the days when you had to just drag and drop sections in Jenkins. Power of any product lies in its code. So welcome _**PIPELINE AS A CODE**_ in JENKINS 2.0.

Now create customized Jenkins job by just coding. Yes, developers love coding. In this era where everyone needs to take end to end ownership from development to DevOps, Jenkins came to rescue by allowing coding of your pipeline.
Let's play with pipeline coding in _**Groovy Script**_ with the help of _**Pipeline Syntax Generator**_ in JENKINS.
