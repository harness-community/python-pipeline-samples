In this tutorial you will learn how you can seamlessly get started with Harness CI for ```Python```. In this pipeline we will be implementing a Hello World Server in `Python`.
### Step 1: Fork the repository 
- Go to [Python-Pipeline-Samples Repo](https://github.com/harness-community/python-pipeline-samples)
- Now fork this repository in your Github [Forking a repository in Github](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
### Step 2: Create your Harness Project

- Move to the Harness Platform & click on Project -> New Project
- Configure the project settings as below

  `Name: (Default Project Name)`


  `Organization: Default`
 
 <img width="1792" alt="Screenshot 2022-09-09 at 10 24 17 AM" src="https://user-images.githubusercontent.com/109092049/192598400-7254737b-ff8b-4e1c-bdc8-6efd2895f011.png">


- Select CI Module in the modules sections


### Step 3: Pipeline Creation & Configure Stages

- Click on `Pipelines` -> Create a Pipeline 
- Configure the pipeline as below

  `Name: CI-Python-Quickstart`

  `Set up pipeline as: Inline`

<img width="1792" alt="Screenshot 2022-09-09 at 10 32 57 AM" src="https://user-images.githubusercontent.com/109092049/192598502-92912fe7-3102-4b77-845c-ba914b684754.png">

To know more about Pipelines [check out the docs here](overview.md)
Next, we are going to add Stages and steps to our Pipeline and compile our Python code.

Click on **[Build step](build.md)**
