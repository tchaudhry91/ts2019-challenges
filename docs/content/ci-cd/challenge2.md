+++
title = "Challenge 2"
weight = 10
+++

## Advanced
You should already be familiar with writing a Jenkinsfile (i.e. pipeline script). Let's start an advanced challenge.

1. Check the status of Jenkins application by browsing to [URL](http://192.168.33.10/). Login with username of `admin` and password is `admin`

2. If the application is not running, start the Jenkins application using the following commands and then try login again

    - `cd /vagrant/challanges/devops/ci-cd`
    - `./start.sh`

3. Create a Jenkins job with the following stages. Read through all the instructions and pick a strategy to complete all the steps.

  - Create 2 output directories
  - Create 2 files in each directory
     - file1_TIMESTAMP.txt & file2_TIMESTAMP.txt in 1st directory
     - file3_TIMESTAMP.txt & file4_TIMESTAMP.txt in 2nd directory
  - File creation in the previous step should be executed in different stages. Both stages need to run in parallel
     - Note the filename should contain TIMESTAMP variable (current time) that would eventually indicate parallelism is achieved
     - _Tip_: current time value in nano seconds is a good idea
  - Archive all the txt files
  - Print timestamps to show when each step of the pipeline is executed
     - _Tip_: Check console output whether timestamp is printed for each step
  - Add sleep step 
  - Enforce timeout for the build job 
  - Read the file "/advanceflag.txt" in a string variable and print it
  - Pass the string variable from previous step to hudson.util.Secret.decrypt() function, and print the output to console
 
4. Get the FLAG by finding the output of decrypt() function from the console output of the build job


---
**HINTS**

 - Use `New Item` on jenkins home page, enter a name for your (pipeline) job, select `Pipeline`, and click OK.
 - Make sure to open [Pipeline Syntax Generator](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) in a new browser tab and 
   copy/paste the generated sample code snippet while building the new job.

 - Check the Console Output for any build number to see the detailed logs and also stack trace for errors. 

 - Start the pipeline always by cleaning the workspace. Refer to pipeline syntax and generate code snippet for cleaning the workspace.
 - Archive is a way to save files outside workspace. You can clean your workspace, run other builds and the file archived is safe. Refer to pipeline syntax and generate code snippet for archival.

 - Observe what happens to the build job if the timeout is more (or less) relative to the sleep time in the pipeline
 - Reading the FLAG file to a String variable might include newline character. Use the split function & 
   get only the first line having the encrypted text. For example, use split("\n")[x] where x is line number

 - Post-challenge clean up:
   - `cd /vagrant/challanges/devops/ci-cd`
   - `./destroy.sh`


