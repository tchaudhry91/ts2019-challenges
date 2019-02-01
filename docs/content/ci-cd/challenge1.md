+++
title = "Challenge 1"
weight = 5
+++

## Basic
Let's start with developing a Jenkins job File in [groovy](http://groovy-lang.org) script. Please refer to [SAMPLE_PIPLELINE]( http://192.168.33.10/job/SAMPLE_PIPELINE/) for a sample job and [Pipeline Syntax Generator](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) to get the sample code snippets for creating a new Jenkins job.

1. Start the Jenkin Server using the following

    - `cd /vagrant/ts2019-challenges/challanges/devops/ci-cd`
    - `./start.sh`

2. Check the status of Jenkin server by browsing to [URL](http://192.168.33.10/). User Name is `admin` and password is `admin`

3. Create a Jenkins Job with following stages:

  - Create ouput directory
  - Create a file in the directory and write some text 
        - Change Directory
        - Create file_TIMESTAMP.txt(TIMESTAMP is a variable representing current time including nano seconds)
  - Print the file "/basicflag.txt"
  - Archive the txt file created under ouput directory
  - To get the FLAG copy the contents of basicflag.txt. Browse to [Decrypt](http://192.168.33.10/script) and run the command ""println(hudson.util.Secret.decrypt("<contents of basicflag.txt>"))"

_**HINTS**_

 - Make sure to go to Pipeline syntax generator select the sample you want the
   code for and click on `Generate Script` to get sample code for each
   step as generator has sample code snippets for all the steps mentioned above
 - Go to New Item to create a Job
 - Always start with cleaning the workspace.
 - Check the Console Output for any build to get the detailed logs and stack
   trace. 
 - Archive is how to save files outside workspace. You can clean your workspace, run other builds and the file archived is safe
 - Use Artifact sample code for Archival

