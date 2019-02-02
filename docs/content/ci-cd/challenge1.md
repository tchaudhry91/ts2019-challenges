+++
title = "Challenge 1"
weight = 5
+++

## Basic
Let's start with developing a Jenkins job using scripted pipeline. Pipelines are written as _Groovy_ scripts. We will develop the script easier way. 

1. Start the Jenkins application using the following

    - `cd /vagrant/challanges/devops/ci-cd`
    - `./start.sh`

2. Check the status of Jenkins application by browsing to [URL](http://192.168.33.10/). Login with username of `admin` and password is `admin`

3. If you are new to pipeline as code, please refer to [SAMPLE_PIPLELINE]( http://192.168.33.10/job/SAMPLE_PIPELINE/) for a simple job. Click on `Configure` on left navigation to review the sample script. 

4. Create a Jenkins job with the following stages. [Pipeline Syntax Generator](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) can be used to refer and copy/paste the sample code snippet while building the new job.

  - Create ouput directory
  - Create a file in the directory and write some text 
        - Change directory 
        - Create file_TIMESTAMP.txt (TIMESTAMP is a variable representing current time include nano seconds)
  - Print the file "/basicflag.txt"
  - Archive the txt file created under ouput directory
  
5. Get the FLAG by decrypting the secret

  - Copy the contents of /basicflag.txt 
  - Navigate to this [utility](http://192.168.33.10/script) 
  - Run the command - println(hudson.util.Secret.decrypt("&lt;contents of basicflag.txt&gt;"))

---
**HINTS**

 - Use `New Item` on jenkins home page, enter a name for your (pipeline) job, select `Pipeline`, and click OK.
 - Make sure to open pipeline syntax generator in a new browser tab, select the sample you want the code for and click on `Generate Script` 
   to get the code snippet for each step as generator has sample code snippets for all the steps mentioned above.

 - Check the Console Output for any build number to see the detailed logs and also stack trace for errors. 

 - Start the pipeline always by cleaning the workspace. Refer to pipeline syntax and generate code snippet for cleaning the workspace.
 - Archive is a way to save files outside workspace. You can clean your workspace, run other builds and the file archived is safe. Refer to pipeline syntax and generate code snippet for archival.

