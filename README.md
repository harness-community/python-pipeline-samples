# Python Sample Pipelines in Harness

![Python Pipeline Samples](https://repobeats.axiom.co/api/embed/4b5f037eb19da59cb5a8357bd2507b6d591f09d2.svg "Python Pipeline Samples")

Introduction
========================
This repository is a home for snippets of YAML code and a sample hello world server for the Harness CI Community.

## Layout

**[Tutorial](docs/CreatePipeline.md)**<br>
**[Requirements](docs/requirements.md)**<br>
**[Harness Sample YAML](.harness/Pipeline.yaml)**<br>
**[Getting Started](#GettingStarted)**<br>
**[Workflow](#Workflow)**<br>
**[Build Instructions](docs/CreatePipeline.md)**<br>

## Getting Started

Use this README to get started with our sample pipeline repository for Python. This guide outlines the basics of getting started with the Harness CI and provides a full code sample for you to try out. This sample doesn’t include configuration options, for in depth steps and configuring the pipeline for example using triggers or using our templates see the Pipeline Configuration Docs.

Here we have built a simple two-stage CI Pipeline in Harness. Setting up and running the Pipeline will take about 30 minutes. The Pipeline will build and run a unit test on a sample nodejs repository, upload the artifact to Docker Hub and then run integration tests. You can use publicly-available code, images, and your Github and Docker Hub accounts.

## Workflow
- Build the code and run unit tests.
- Package the app as a Docker image and upload it to Docker Hub.
- Pull the uploaded image to the build farm as a Background Task. Check out more about background tasks here
- Run an integration test against the sample app.

## Graphical Summary

![alt text](https://files.helpdocs.io/i5nl071jo5/articles/x0d77ktjw8/1611599684642/image.png)

## Docs

**[Pipeline Creation & Build Set-up](docs/CreatePipeline.md)**<br>
**[Configuring the infrastructure & setting up Build & Run Unit Test stage](docs/build.md)**<br>
**[Build & Push Image to Docker](docs/DockerPush.md)**<br>
**[Create Integration Stage and Run the Pipeline](docs/Integration.md)**<br>

## Licensing

MIT License
