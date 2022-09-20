# python-pipeline-samples
**Before you begin **
1. Make sure you go through Harness Key Concepts 
https://docs.harness.io/article/hv2758ro4e-learn-harness-key-concepts
https://docs.harness.io/article/len9gulvh1-harness-platform-architecture
2. **GitHub account** -Make sure you have a github account . 
https://docs.harness.io/article/kqik8km5eb-source-code-manager-settings#source-code-manager-settings
3. **DockerHub Account**-Make sure to have a Docker-Hub Account.
Other artifactory packages are also there :
https://docs.harness.io/article/66ykcm0sf0-build-and-push-to-gcr-step-settings
4. **Kubernetes cluster.**
https://docs.harness.io/article/sjjik49xww-kubernetes-cluster-connector-settings-reference
5. **Harness delegate**
https://docs.harness.io/article/f9bd10b3nj-install-a-kubernetes-delegate

We will be using this repository as an example :
https://github.com/harness-community/python-pipeline-samples.git
  
**Step 1:Create Project**

1. In the Harness Platform click on Project and then New Project
    Name: (Name of your project)
    Organization -Default 
    Invite Collaborators(optional):You don't need to add yourself

<img width="1792" alt="Screenshot 2022-09-09 at 10 24 17 AM" src="https://user-images.githubusercontent.com/109092049/190948455-c96c7a3b-3f15-405d-bf41-44bda791211d.png">

2. In modules click Continuous Integration 

<img width="1792" alt="Screenshot 2022-09-09 at 10 32 11 AM" src="https://user-images.githubusercontent.com/109092049/190948697-3e77346c-eb33-4402-837e-75b0b5382261.png">

NOTE :

A)**Docker Connector** :
 1. Go to Connectors under Project setup 
 2. Click on **New Connector **
 3. Click on **Docker registry **
 Change the settings as following 
   A.Overview 
   Name-docker quickstart 
   B.Details 
   Docker registry url -https://index.docker.io/v1/
   Provider type - Docker Hub 
   Authentication -Username and Password
   Username - Docker hub username 
   Secret Token -
   Click on new secrets 

   Steps to get secret token in docker hub :
   1. Go to your docker hub account 
   2. Go to account settings 
   3. 3.Go to Security 
   4. Click on New Access token 
   5. Give name of your access token and copy the token generated and paste it somewhere safely as token once generated can be retrieved , if lost you have to create a new token 
   <img width="1074" alt="Screenshot 2022-09-11 at 7 29 16 PM" src="https://user-images.githubusercontent.com/109092049/190966472-9a75f70d-0e33-4bed-bdb1-91d1c271d19d.png">
   **Connect to Provider** -Choose connect through harness delegate 
   **Select harness delegate** - Select the delegate you created.
   It will take sometime to verify your credentials and you will see something similar to screenshot shown below
   
   <img width="1792" alt="Screenshot 2022-09-11 at 7 31 46 PM" src="https://user-images.githubusercontent.com/109092049/190966611-539df258-1fba-4838-bfd4-cebc0c8508a2.png">
   
B)**Harness Github Connector  **
   1. Go to Connector under project setup 
   2. Click on New Connector 
   3. Click on GitHub 
   Change the settings as follows :
    A. Overview 
       Name - pysampleconnector
    B. Details 
       URL Type - Account 
       Connection Type - HTTP 
       Github Account URL - Your github account url where you have forked the repository
       Test Repository - pythom-pipeline-samples
    C. Credentials
       Authnetication - Username and token 
       Username - Github username 
       Personal access Token - Select the token you created
         Follow the below steps for secret creation :-
         Creating PAT in Github -https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
       After copying the PAT , from your github account keep it safely .
       1.Click on create New Secrets Text
       2.Give your Secret Name 
       3.Give your Secret Value-(Github PAT)
       4.Click save
       Click on Enable API access(recommended)
       API Authentication 
       Personal Acess token - Click on the personal access token you created in the previous  step


Now, Let's move forward creating our first Pipeline
   

**Step 2:Create Pipeline**

Click on Pipelines and then on click on Create a Pipeline


1. Name:CI-Python-Quickstart 
2. Select Inline
<img width="1792" alt="Screenshot 2022-09-09 at 10 32 57 AM" src="https://user-images.githubusercontent.com/109092049/190948998-1b01d2be-ffae-43cd-9286-a211bb78e652.png">

3. Go to yaml in the pipeline studio 
4. Click on Edit yaml 
5. Copy and paste the Pipeline.yaml file and add below the pipeline settings :

**Pipeline.yaml**
  tags: {}
  properties:
    ci:
      codebase:
        connectorRef: pysampleconnector
        build: <+input>
        depth: <+input>
        prCloneStrategy: <+input>
  stages:
    - stage:
        name: build test and run
        identifier: build_test_and_run
        type: CI
        spec:
          cloneCodebase: true
          execution:
            steps:
              - step:
                  type: Run
                  name: Code compile
                  identifier: Code_compile
                  spec:
                    connectorRef: account.harnessImage
                    image: python:3.10.6-alpine
                    shell: Sh
                    command: |-
                      python3 -m venv venv
                      python -m compileall ./
              - step:
                  type: Run
                  name: Create image
                  identifier: Create_image
                  spec:
                    connectorRef: docker_Quickstart
                    image: alpine
                    shell: Sh
                    command: |-
                      touch pythondockerfile
                      cat > pythondockerfile <<- EOM
                      FROM python:3.10.6-alpine
                      WORKDIR /py-sample-proj
                      ADD . /py-sample-proj
                      RUN pip install -r requirements.txt
                      CMD ["python" , "app.py"]
                      EOM
                      cat pythondockerfile
              - step:
                  type: BuildAndPushDockerRegistry
                  name: Build and Push an image to docker registry
                  identifier: Build_and_Push_an_image_to_docker_registry
                  spec:
                    connectorRef: <+input>
                    repo: <+input>
                    tags:
                      - latest
          infrastructure:
            type: KubernetesHosted
            spec:
              identifier: k8s-hosted-infra
    - stage:
        name: Integration test
        identifier: Integration_test
        type: CI
        spec:
          cloneCodebase: true
          infrastructure:
            useFromStage: build_test_and_run
          execution:
            steps:
              - step:
                  type: Background
                  name: "python server "
                  identifier: python_server
                  spec:
                    connectorRef: <+input>
                    image: <+input>
                    shell: Sh
                  description: "server connection "
                  failureStrategies: []
              - step:
                  type: Run
                  name: "test connection to server "
                  identifier: test_connection_to_server
                  spec:
                    connectorRef: <+input>
                    image: curlimages/curl:7.73.0
                    shell: Sh
                    command: |-
                      sleep 10
                      curl localhost:5000

6. Click on **Save** 
7. Click on **Run **

<img width="1792" alt="Screenshot 2022-09-19 at 9 52 38 AM" src="https://user-images.githubusercontent.com/109092049/190949729-1da8060e-009a-4ab9-a4ce-2d20b43fe77e.png">

After clicking on run you will see the following options to provide your inputs :

<img width="1792" alt="Screenshot 2022-09-19 at 10 26 01 AM" src="https://user-images.githubusercontent.com/109092049/190952110-d67fb9f1-8a61-4b2e-8f6d-536f2ce5d422.png">

->CI Codebase 
  1. Branch Type : Git Branch 
  2. Branch Name : main
->build test and run 
  1. Docker connector - Docker connector you created 
  3. Docker Repository - <docker-hub-username>/<docker-repository name>)You can either push to some existing repository or create a new one in docker hub.
->Integration test
  step:python server
  1. Container Registry - docker connector you created 
  2. Image - <docker-hub-username>/<docker-repository name>)You can either push to some existing repository or create a new one in docker hub.
  step:test connection to server 
  1. Container Registry - docker connector you created 
  
  Select Skip Pre-flight check 
  Click on Run Pipeline
  
  You will see something similar to the screenshot attached below:
  
  <img width="1305" alt="Screenshot 2022-09-20 at 10 38 43 AM" src="https://user-images.githubusercontent.com/109092049/191172562-43f3e029-26e7-4bc4-a519-e5e54d5335f4.png">

  Congrats you have successfully created your CI-pipeline. 
  
