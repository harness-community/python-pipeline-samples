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
         ```
         
      ## Point to ponder on: 
      - If you head over to the location of **[requirements.txt](https://github.com/harness-community/python-pipeline-samples/blob/main/requirements.txt)** and see the contents of this text file, you will see that the multiline arguments are sorted in ascending         order. This is an optimization technique. This makes it easier to update and avoid duplicate packages. For more optimization techniques to make Pipeline run           faster, check out **[this document](https://docs.harness.io/article/g3m7pjq79y-optimizing-ci-build-times#optimize_docker_images_to_reduce_build_times)**
         
      
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

Now we move to Integration Testing and running our Pipeline

Click on **[Integration Test and Run Pipeline](Integration.md)**
