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

3. If you are new to Jenkins please refer to Appendix1 and Appendix2 at the end.

4. create a new Jenkins job with the following 4 stages
  - Create output directory
  - Create a file in the directory and write some text
        - Change directory
        - Create file_TIMESTAMP.txt (TIMESTAMP is a variable representing current time include nano seconds)
  - Print the file "/basicflag.txt"
  - Archive the text file created in output directory.

5. To create a new job go to [Jenkins](http://192.168.33.10/).
  - On top right corner click on `New Item`
  - Enter `testpipe` as job name
  - select `pipeline` from the list below
  - click `ok` button at the bottom
  - On the next page click on `pipeline` tab.
  - Make sure `Pipeline script` is selected for Definition

      _**Tip:**_
            - Now our script has to be written under the script editor in pipeline section(Refer to snapshot)

6. Let's create pipeline stages
  - Stage1: Create output directory
      - copy below script block and paste it in script editor

        ```
        node
        {
          stage('1. Create Dir')
        {
          sh 'mkdir -p output'
        }
        ```
  - Stage2: Create File in output directory with timestamp
      - copy below script block and paste it in script editor

        ```
          stage('2. Create File')
        {
          dir('output')
          {
            sh 'touch file_`date +%F-%T-%N`.txt'
          }
        }
        ```
  - Stage3: print file "/basicflag.txt"
      - copy below script block and paste it in script editor

        ```
          stage('3. Print File')
        {
          sh 'cat /basicflag.txt'
        }
        ```
  - Stage4: Archive text file
      - copy below script block and paste it in script editor

        ```
          stage('4. Archive File')
        {
          dir('output')
          {
          archiveArtifacts '*.txt'
          }
        }
      }
        ```

7. Click on `Save` button and this will redirect you to pipeline menu
8. Click on `Build Now` to run the `testpipe` job pipeline
9. Ensure that the build completed successfully

    _**Tip**:_ All 4 stages should be in `Green` under `Stage View`.
10. To check the output:
  - click on the Build number under `Build History`. This will take you to the build run page
  - click on `Console Output` on left menu
  - search for a long alpha-numeric string in console output and copy it (copy start and end braces of the string as well)

11. To get the Flag
  - Go to [Script Console](http://192.168.33.10/script)
  - Replace xxx in the `println(hudson.util.Secret.decrypt(”<<xxx“))` command with the string copied in previous step
  - Click on `Run` button
  - Result obtained is the flag for this challenge

         _**^^^^^^^^^^^^^^ Hurray!!!! You solved the challenge. Let's do one more ^^^^^^^^^^^^^^**_


_**Appendix1**_: Let's look at a sample pipeline (or Job).Browse to sample_pipeline job at [SAMPLE_JOB]( http://192.168.33.10/job/SAMPLE_PIPELINE/). Under `Stage View` observe that job has 2 stages, `Welcome` and `All the best for your DevOps Challenge` and under `Build History` we can see 6 builds out of which 4 builds (#1, #4, #5, #6) are successful and 2 builds(#2 and #3) has failed.Click on `configure` and go to `Pipeline` tab to see the pipeline code.We will be building a similar script in our challenge. You can close the browser once this step is done.

_**Appendix2**_: To create a pipeline script let's take the help of Pipeline Syntax Generator. In a new browser window, open [Pipeline Syntax Generator](http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/) ,select a `Sample Step` for which you need syntax for, provide required inputs and click on `Generate Script`.

 _**For eg**_: Select `sh: Shell Script` for sample step and provide `mkdir -p test` as input under Shell Script. Click on Generate Script which will give the sample code which looks like:
 ```
 sh 'mkdir -p test'
 ```
