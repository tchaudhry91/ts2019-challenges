+++
title = "Challenge 2"
weight = 10
+++

## Advanced
Now you should be already familiar with writing a Basic JenkinsFile,Let's do an advanced one.
Create a job with the following stages.Read through all the instructions and pick a strategy to complete all the steps

1. Create 2 output directories
2. Create 2 files in each directory
   - file1_TIMESTAMP.txt & file2_TIMESTAMP.txt in 1st directory
   - file3_TIMESTAMP.txt & file4_TIMESTAMP.txt in 2nd directory
3. File creation in the previous step should be executed in different stages. Both stages need to run in parallel
   - Note the filename should contain TIMESTAMP variable (current time) that should eventually indicate parallelism is achieved
   - _Tip_: current time value in nano seconds is a good idea
4. Archive all the txt files
5. Add sleep step in the pipeline  
6. Enforce timeout for the build job 
7. Print timestamps to show when each stage of the pipeline is executed
   - _Tip_ :Check console output whether timestamp is printed for each step
8. Read the file "/advanceflag.txt" in a string variable and print it
9. Once build run has completed, for FLAG copy the contents of advanceflag.txt from console output, Browse to [Decrypt](http://198.168.33.10/script) and run the command ““println(hudson.util.Secret.decrypt(”<content here>”))”

_**Hints**_

  - Make sure to open pipeline syntax in a new browser tab or browser window to copy/paste code snippet
  - Always start with cleaning the workspace.
  - Check the Console Output for any build to get the detailed logs and stack trace.
  - Archive is how to save files outside workspace. You can clean your workspace, run other builds and the file archived is safe
  - Use Artifact sample code for Archival
  - Observe what happens to the build job if the timeout is more (or less) relative to the sleep time in the pipeline
  - Reading the FLAG file to a String variable might include newline character. Use the split function & get only the first line. For example, use split("\n")[x] where x is line number

Post-challenge clean up:

- `cd /vagrant/ts2019-challenges/challanges/devops/ci-cd/`
- `./destroy.sh`


