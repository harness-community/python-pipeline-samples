# Python Sample Pipelines in Harness

Introduction
========================
This repository is a home for snippets of YAML code and a sample hello world server of scripting for the Harness CI Community.

## To Do

TO DO:
- [ ] Understanding the basics of Harness 
- [ ] Requirements
- [ ] Environment
- [ ] Steps to use the samples on Harness App
- [ ] Explain a bit on what the sample app does
- [ ] Other useful links
- [ ] License info
- [ ] [Harness Community - Communication Guide](https://github.com/harness-community/overview/blob/main/community_communication_guide.rst)


## Layout

**[Tutorial](docs/tutorial.md)**<br>
**[Requirements](docs/requirements.md)**<br>
**[Harness Sample YAML](https://github.com/harness-community/python-pipeline-samples/blob/main/.harness/input.yaml)**<br>
**[Getting Started](#GettingStarted)**<br>
**[Workflow](#Workflow)**<br>
**[Build Instructions](docs/CreatePipeline.md)**<br>

## Getting Started

Use this README to get started with our sample pipeline repository for Python. This guide outlines the basics of getting started with the Harness CI and provides a full code sample for you to try out. This sample doesn’t include configuration options, for in depth steps and configuring the pipeline for example using triggers or using our templates see the Pipeline Configuration Docs.

Here we have build a simple two-stage CI Pipeline in Harness. Setting up and running the Pipeline will take about 30 minutes. The Pipeline will build and run a unit test on a sample nodejs repository upload the artifact to Docker Hub and then run integration tests. You can use publicly-available code, images, and your Github and Docker Hub accounts.

## Workflow
- Use a Kubernetes cluster build farm.
- Build the code and run unit tests in the build farm.
- Package the app as a Docker image and upload it to Docker Hub.
- Pull the uploaded image to the build farm as a Background Task. Check out more about background tasks here
- Run an integration test against the sample app.

## Graphical Summary

![alt text](https://files.helpdocs.io/i5nl071jo5/articles/x0d77ktjw8/1611599684642/image.png)

## Docs

**[Pipeline Creation & Build Set-up](https://github.com/krishi0408/sample-app/blob/main/docs/CreatePipeline.md)**<br>
**[Configuring the infrastructure & setting up Build & Run Unit Test stage](https://github.com/krishi0408/sample-app/blob/main/docs/build.md)**<br>
**[Build & Push Image to Docker](https://github.com/krishi0408/sample-app/blob/main/docs/DockerPush.md)**<br>
**[Create Integration Stage and Run the Pipeline](https://github.com/krishi0408/sample-app/blob/main/docs/Integeration.md)**<br>

## Licensing

MIT License
