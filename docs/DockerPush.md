##  DockerFile Creation  
 
 - Click on `Add step`
   - Go to builds and click on run 
   - Change the settings as following:
   
      - Name: `create Docker file`
      - Container registry: Click on the Docker connecter created in the previous step 
      - Image: `alpine`
      - Commands: Copy the following command and click on apply changes.
 
         ```
         touch pythondockerfile
         cat > pythondockerfile <<- EOM
         FROM python:3.10.6-alpine
         WORKDIR /python-pipeline-samples
         ADD . /python-pipeline-samples
         RUN pip install -r requirements.txt
         CMD ["python" , "app.py"]
         EOM
         cat pythondockerfile
   
   
   ![create_dockerfile_step_step](/Images/create_dockerfile_step_step.png)    
   
   
 ## Build and Push Image to Docker Registry
 - Click on `Add step`
 - Go to `builds` and click on `build and push an image to docker registry`
 -  Change the settings as following:
    - Name: `Build and push image to docker hub`
    - Docker connector: select the Docker connector you created previously 
    - Docker repository: `<docker-hub-username>/<docker-repository name>`
    - Tags: `latest`
    - In the optional Configuration
      - Dockerfile - ```pythondockerfile```

![build_and_push_image_to_docker](/Images/build_and_push_image_to_docker.png)   

Now we move to Integration Testing and running our Pipeline

Click on **[Integration Test and Run Pipeline](Integration.md)**
