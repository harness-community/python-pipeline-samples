### Integration Testing 

#### Python server
Now you have a Stage to clone, build, containerize, and then push your image to Docker Hub. In this step you'll add a Stage to pull that image, run it       in a container, and run integration tests on it.

- Click Add stage and select ```build```
- Name it as ```integration test``` 
- Turn off ```clone from codebase``` 
- Click ```setup stage``` 
  - Go to the ```Stage overview``` turn on ```Clone Codebase```

    - Now we will setup Stage Infrastructure
      - Go to Infrastructure and select propagate from an existing stage.
        - Select the previous stage
        - Click ```Next```
In the Build Test and Push stage, you built your code and pushed your built image to Docker Hub.
Harness will pull the image onto the container in your infrastructure. Next, it will start the Hello World Server in the image.

   - Go to execution tab in run integration stage 
       - Select ```add step``` 
         -  Go to builds and select background 
       - Change the settings as following 
          - Name: ```python server``` 
          - Description(optional): ```server connection```
          - Container registry: select the Docker connector you created previously
          - Shell: ```Sh```
          - Command: ```python3 /python-pipeline-samples/app.py```
          - Select ```Apply changes``` 
#### Connecting to server
Next, we can run an integration test. We'll simply test the connection to the server.
- Select add step in the execution tab of run integration stage 
  - Go to Builds and select Run 
    - Change the settings as following 
       - Name: ```test connection to server``` 
       - Container registry: select Docker connector you created .
       - Image: ```curlimages/curl:7.73.0```
       - Commands:
        ```
        sleep 10
        curl localhost:5000
       ```
     - Select ```Apply Changes```.
## Run the Pipeline
 - Click ↑Save.
 - Click ```Run```. 
 - The Pipeline Inputs settings appear.
   - Under CI Codebase, select ```Git branch```.
   - In Git Branch, enter the name of the branch where the codebase is, here ```main```
     - Click Run Pipeline.

