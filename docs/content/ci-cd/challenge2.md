+++
title = "Challenge 2"
weight = 10
+++

## Advanced
You should already be familiar with writing a Jenkinsfile (i.e. pipeline script) by now. Let's start an advanced challenge.

1. Check the status of Jenkins application by browsing to [Jenkins](http://192.168.33.10/). Login with username:`admin` and password:`admin`

2. If the application is not running, start the Jenkins application using the following commands and then try login again [Jenkins](http://192.168.33.10/)

    - `ssh devops`
    - `cd /vagrant/challanges/devops/ci-cd`
    - `./start.sh`

3. _**Overview of Challenge2**_:Create a Jenkins job with the following stages:

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

4. To create a new job go to [Jenkins](http://192.168.33.10/).
  - On top left corner click on `New Item`
  - Enter `parpipe` as job name
  - select `pipeline` from the list below
  - click `ok` button at the bottom
  - On the next page click on `pipeline` tab.
  - Make sure `Pipeline script` is selected for Definition

      _**Tip:**_
            - Now our script has to be written under the script editor in pipeline section(Refer to snapshot)
              ![Script Editor](/images/Jenkins.png)

6. Let's create pipeline stages
  - Stage1: Create 2 output directories with timeout and timestamp set.
      - copy below script block and paste it in script editor

        ```
        node {
        cleanWs()
    timestamps
      {
      timeout(time: 10, unit: 'SECONDS')
        {
        stage('1. Create Dirs')
        {
            sh ' mkdir -p output1 output2'
        }
        ```
  - Stage2: Create 2 files in each output directory in parallel
      - copy below script block and paste it in script editor

        ```
        stage ('2. Create Files')
        {
            parallel First:{
            dir('output1') {
                sh 'touch file1_`date +%F-%T-%N`.txt file2_`date +%F-%T-%N`.txt'
            }
            },Second:{
            dir('output2') {
                sh 'touch file3_`date +%F-%T-%N`.txt file4_`date +%F-%T-%N`.txt'
            }
            },
            failFast: true|false
        }
        ```
  - Stage3: Archive text files and sleep  
      - copy below script block and paste it in script editor

        ```
        stage('3. Archive Files')
            {
                archiveArtifacts '*/*.txt'
            }
        sleep time: 5, unit: 'SECONDS'
        ```
  - Stage4: Decrypt File  
      - copy below script block and paste it in script editor

        ```
        stage('4. Decrypt File')
        {
          String key=readFile '/advanceflag.txt'
          echo key.split("\n")[0]
          println(hudson.util.Secret.decrypt(key.split("\n")[0]))
        }
        }
        }
        }

        ```
7. Click on `Save` button and this will redirect you to pipeline menu
8. Click on `Build Now` to run the `parpipe` job pipeline
   _**Tip**:_ Job will fail for the first time. Got to console output. To solve it
          - Go to console output and search for a hyperlink "Administrators can decide whether to approve or reject this signature."
          - click on the hyperlink and script approval page will open
          - Click on Approve button
9. Go back to `parpipe` [job](http://192.168.33.10/job/parpipe) and click on `Build Now`
10. Ensure that the build completed successfully

    _**Tip**:_ All stages should be in `Green` under `Stage View`.

11. To check the output:
  - click on the Build number under `Build History`. This will take you to the build run page
  - click on `Console Output` on left menu
  - search for string that starts with `techsummit<>` in console output
  - This string is the flag for this challenge


<a href="https://ctf.ts2019.adobe.com/challenges#CI/CD%202" target="_blank"> Link to enter flag </a> 


    _**^^^^^^^^^^^^^^ Congratulations and Greattt Job!!!! ^^^^^^^^^^^^^^**_
