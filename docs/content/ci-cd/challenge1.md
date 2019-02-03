+++
title = "Challenge 1"
weight = 5
+++

## Basic
Let's start with developing a Jenkins job using scripted pipeline. Pipelines are written as _Groovy_ scripts. We will develop the script easier way.

1. Start the Jenkins application using the following

    - `ssh devops`
    - `cd /vagrant/challanges/devops/ci-cd`
    - `./start.sh`

2. Check the status of Jenkins application by browsing the link [Jenkins](http://192.168.33.10/). Login with username:`admin` and password:`admin`

3. Let's look at a sample pipeline (or Job).Browse to sample_pipeline job at [SAMPLE_JOB]( http://192.168.33.10/job/SAMPLE_PIPELINE/). Under `Stage View` observe that job has 2 stages, `Welcome` and `All the best for your DevOps Challenge` and under `Build History` we can see 6 builds out of which 4 builds (#1, #4, #5, #6) are successful and 2 builds(#2 and #3) has failed.Click on `configure` and go to `Pipeline` tab to see the pipeline code.We will be building a similar script in our challenge. You can close the browser once this step is done.

4. To create a pipeline script let's take the help of Pipeline Syntax Generator. In a new browser window, open        [Pipeline Syntax Generator](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) ,select a `Sample Step`
   for which you need syntax for, provide required inputs and click on `Generate Script`. _**For eg**_: Select `sh: Shell Script` for sample step and provide `mkdir -p test` as input under Shell Script. Click on Generate Script which will give the sample code which looks like:
```
sh 'mkdir -p test'
```
5. Now, we the information from step 3 and step 4 ,Let's create a new Jenkins job with the following 4 stages

  - Create ouput directory
  - Create a file in the directory and write some text
        - Change directory
        - Create file_TIMESTAMP.txt (TIMESTAMP is a variable representing current time include nano seconds)
  - Print the file "/basicflag.txt"
  - Archive the text file created in output directory.

6. To start with ,go to [Jenkins](http://192.168.33.10/). On top right corner click on `New Item`
   to create a new job. Enter job name , select `pipeline` from the list below
   and click `ok` at bottom right corner of the list.On the next page click on `pipeline` tab.
   Make sure `Pipeline script` is selected for Definition. We have to insert the code under script, save/apply it and  build it. So to get the code for each stage and step, let's use
   pipeline syntax generator we used in step2.

    _**Tip**_: Pipeline Syntax Generator has code snippets for all the steps to do this challenge. You can use shell scripts or Groovy script to get the job done.

7. You can use the Pipeline Syntax Generator [URL](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) used in step 3 or open a new browser in case if you have closed it. By this time , you should have 2 browser windows open, one with pipeline syntax generator and other one where we will be creating a new job.
Let's start with how to create stages and move further.
    - _**How to create stages:**_
            - In Syntax Generator , select 'stage:Stage' for Sample step and provide a stage
              name to generate the script. Copy this code and paste it to other browser
              where we have started creating a new job in Step5 under Script. Code will look like
              this (observe we have added node code, which is advanced for this challenge, but make sure you add it to the code)

        ```
        node
        {
          stage('StageName')
        {
          code block
        }
        }
        ```
    -  _**Create Ouput Directory(Stage1):**_
            - In Syntax Generator, select 'sh:Shell Script' for Sample step and provide `mkdir -p output`
              as input under shell script. copy this code and paste it in the other browser under script and inside the stage 'Create Dir' code block. Final code for step 1( i.e  Stage 1) should look like this:

        ```
        stage('Create Dir')
        {
          sh 'mkdir -p output'
        }
        ```
    - _**Create a file in the directory(stage2):**_
           - Now, we can use the code from 'How to create stages' to create stage2 and use the same shell script     pipeline code and perform change directory and create file in this stage. Stage 2 code looks:

        ```
         stage ('Create File')
         {
            sh 'cd output && touch file_`date +%F-%T-%N`.txt'
         }
        ```
    - _**Code With Stage1 and Stage2:**_
          - Code so far should look like

          ```
          node
          {
            stage('Create Dir')
          {
            sh 'mkdir -p output'
          }
          stage ('Create File')
          {
             sh 'cd output && touch file_`date +%F-%T-%N`.txt'
          }
          }
          ```

8. Go ahead and create the stages for stage 3 and 4 the same way we did in step 6. Once you are done with adding all stages, save\apply the script and you are prompted with saved, on top right corner click on the job name. Now, you can run a build using `Build Now` option. Go ahead and run a build. Now, you should all 4 stages and the build history for the new job thats created same as we did for sample_pipeline job in step2.

    _**Tip**:_ Archive is a way to save files outside workspace. You can clean your workspace, run other builds and the file archived is safe. For Stage4 use Artifacts sample code from pipeline generator.

9. Once all the stages of the build has completed , to get the detailed output & logs, click on the
   build number, then console output. Console Output can also see the details if the build has failed. Check the error, make the required changes in code and re-run the build using `Build Now`. If you are facing any issues, take the help of a volunteer.

    _**Tip**:_ In order to edit the job code, follow the same procedure mentioned in step2 but for the job that is newly created. In case if you haven't found the job , browse to [URL](http://192.168.33.10/) and can see list of all pipelines

10. To get flag for this challenge, check the output of printing file
   "/basicflag.txt" under console output for successful build, copy the content ,go to
   [Utility](http://192.168.33.10/script) and run the command _**println(hudson.util.Secret.decrypt("contents of basicflag.txt"))**_

**MORE HINTS**

 - Check the Console Output for any build number to see the detailed logs and also stack trace for errors.

 - Start the pipeline always by cleaning the workspace. Refer to pipeline syntax and generate code snippet for cleaning the workspace.
