### Build Step
- Click on `Add Stage` to get started with the pipeline creation
- Select the type of stage as `Build`

<img width="1792" alt="Screenshot 2022-09-09 at 10 53 12 AM" src="https://user-images.githubusercontent.com/109092049/192598696-a311f0b8-5c8e-46be-9a48-779d1c358bbb.png">

- Configure the Stage Settings as below
  - Name: `build test and run`
  - Make sure to turn on `clone codebase`.


![configure_the_stage_setting](/Images/configure_the_stage_setting.png)


**Setup the Connector as follows**

Select `Connectors` -> Click on `+ New Connector`

Connector Type: `Github`

<img width="1792" alt="Screenshot 2022-09-09 at 10 55 35 AM" src="https://user-images.githubusercontent.com/109092049/192598730-107417b7-4aa3-410b-9379-346b66d3e58d.png">

Name: `python-sample-connector`

URL Type : `Repository`

Connection Type: `HTTP`

GitHub Repository URL: Paste the link of your forked repository

Username: (Your Github Username)

Personal Access Token: [Check out how to create personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

Secret Name: `Git-Token`

Secret  Value: PAT value generated in Github

Click on Save.

This will allow the repository to be fetched click on it and click `Apply Selected`

Make Enable API access (ON) with the secret token created

Click on **Connect through Harness Platform**.

To develop more understanding on Connectors [check out the docs here](overview.md)

Go the Infrastructure settings of stage and click on `Hosted by Harness`.

Then go to Execution (In this step we are going to compile the code)

![infrastructure_setting(build_test_and_run)](/Images/infrastructure_setting(build_test_and_run).png)

#### Code Compilation

- Click on `Add step`
 - Go to `Build` and click on `Run`
 - Change the settings as following 
 - Name: `Code compile`
 - Container Registry -> Choose `New connector`
   - Click on `Docker Registry`
   - Change the settings as following 
       - Overview 
         - Name- `docker quickstart`
       - Details 
         - Docker registry url -  `https://index.docker.io/v1/`
         - Provider type - `Docker Hub`
         - Authentication - `Username and Password`
         - Username - Docker hub username 
         - Secret Token - [Check out how to create docker PAT](DockerPat.md)
       - Connect to Provider 
         - Choose to connect through the Harness Platform
         - It will take sometime to verify your credentials.
  - Image: `python:3.10.6-alpine`
  - Shell: `Sh`
  - Command:
    `python -m compileall ./`
    
  - Then click `Apply changes`



![Code_Compilation_CI](/Images/Code_Compilation_CI.png)




Next we are going to create Image and Push the image to docker registry 

Click on **[Create Image and Push to Docker Registry](DockerPush.md)**
