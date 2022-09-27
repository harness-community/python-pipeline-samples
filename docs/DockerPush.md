##  Image Creation  
 
 - Click on ```Add step```
   - Go to builds and click on run 
   - Change the settings as following:
   
      - Name: ```create image``` 
      - Container registry: Click on docker connecter created in the previous step 
      - Image: ```alpine```
      - Commands: Copy the following command and click on apply changes.
 
         ```
         touch pythondockerfile
         cat > pythondockerfile <<- EOM
         FROM python:3.10.6-alpine
         WORKDIR /py-sample-proj
         ADD . /py-sample-proj
         RUN pip install -r requirements.txt
         CMD ["python" , "app.py"]
         EOM
         cat pythondockerfile
         ```
         
      
 ## Build and Push Image to Docker Registry
 - Click on ```Add step```
 - Go to ```builds``` and click on ```build and push an image to docker registry```
 -  Change the settings as following:
    - Name: ```Build and push image to docker hub```
    - Docker connector: select the Docker connector you created previously 
    - Docker repository: ```<docker-hub-username>/<docker-repository name>```
    - Tags: ```latest```

Now we move to Integeration Testing and running our Pipeline

Click on **[Integeration Test and Run Pipeline](Integeration.md)**
