### Concept

CI/CD automation engine.
Reliable software releases through automation engine. Packages built and deployed whether it is a local sandbox or a shared environment. Pipelines extend this much further to enable continuous delivery. 

### Tool

Jenkins

### Story

Adobe has acquired a company Magento and management has asked you to rebrand the magento's website as Adobe's property.

Engineer is called in the middle of night to make a code/configuration change and deploy it quickly to Production. 

To achieve this, you have to make some changes in code and trigger a build which can do the below things:

1. Whenever you commit your code in git, a webhook will be triggered.
2. Webhook will trigger a Jenkins job.
3. Jenkins job will pull the code change and compile it if necessary (and optionally commit it to a remote server as a versioned artifact).
4. Assuming we've an artifact... setup a post-build task which will download the artifact from the remote storage and will deploy the artifact to the web/application server.

Gone are the days when you had to just drag and drop sections in Jenkins. Power of any product lies in its code. So welcome PIPELINE AS A CODE in JENKINS 2.0.

Now create customized Jenkins job by just coding. Yes, developers love coding. In this era where everyone needs to take end to end ownership from development to DevOPS, Jenkins came to rescue by allowing coding of Pipeline. 



ASK: User needs to create a JENKINSFILE which is a groovy scripts. Remaining steps (integration with Git) are simple and one time. We focus here on just the Jenkinsfile. 



#### Hands-on set up instruction : 

Pre requisites are pre-installed on the Laptops (or provided with a script to run)

Docker image with built-in Jenkins and a sample job 


### Challenges

#### Basic

 - Create output directory
 - Create a file in the directory and write some text
 - Change Directory
 - Create `file_TIMESTAMP.txt`


Archive the files under directory created


#### Advanced

 - Create 2 output dir
 - Write in 2 files
 - Both stages need to run in parallel. File should contain timestamp which should be identical indicating parallelism
 - Archive all files
 - Enforce timeout and sleep pipeline steps
 - Use timestamps
 - Read file from filesystem (Which contains `FLAG`)

#### SETUP INSTRUCTIONS:


`ssh devops`

`cd /vagrant/challanges/devops/ci-cd`

`./start.sh`

Example output

```
deployment.apps/jenkins created
Waiting for deployment "jenkins" rollout to finish: 0 of 1 updated replicas are available...
deployment "jenkins" successfully rolled out
service/jenkins created
ingress.extensions/jenkins created
```

Help guide: 

Open `http://192.168.33.10/job/SAMPLE_PIPELINE/pipeline-syntax/` in your browser  (Use admin/admin to auth)

FLAG: `http://192.168.33.10/script` - User will be asked to find or given a random text which needs to be decrypted. Ex: {AQAAABAAAAAQvy72G6TPt008hCqWJuLVsOIHVPx5+tqBJUsnnCPEo+Y=}

`println(hudson.util.Secret.fromString("kasingh").getEncryptedValue())`

`println("FLAG="+hudson.util.Secret.fromString("{AQAAABAAAAAQvy72G6TPt008hCqWJuLVsOIHVPx5+tqBJUsnnCPEo+Y=}").getPlainText())`

