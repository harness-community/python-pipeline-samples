## Harness CI

Harness Continuous Integration tool is built with test intelligence, native secrets, fine-grained RBAC, and extensible governance as one of the best solutions in the marketplace for automated pipelines. Automated pipelines remove user errors, provide feedback loops to developers, and help enable fast product iterations.

### What is a pipeline?

A Pipeline is an end-to-end process that delivers a new version of your software. It can be considered to be a cyclical process that includes integration, delivery, operations, testing, deployment, real-time updates, and metrics monitoring.


For example, A pipeline can use the CI module of Harness to build, test & push code and then also a CD module to deploy the artifact to the production environment.


### Stages in a Pipeline

A CI Stage is a subset of a Pipeline that performs one major segment of the CI workflow. A Build Stage includes Steps for building, pushing, and testing your code. The first stage in a Pipeline includes the default Codebase for the Pipeline and shares it with later stages.

See [CI Stage Settings](https://docs.harness.io/article/yn4x8vzw3q-ci-stage-settings)


### Steps in a Pipeline

A Stage contains one or more Steps. Each Step is a series of commands that perform a task. A Build and Push Step builds an image and pushes it to a cloud repo, a Run Step runs a series of shell commands, and so on.

When a Pipeline runs, it creates a temporary volume called a Workspace. The Build Stage clones your codebase to the root of the Workspace and runs Steps inside the root. The Workspace persists for the lifetime of the Stage and enables individual Steps to communicate and share the state information.

Harness CI includes an extensive Step Library for common CI tasks: building artifacts, uploading to cloud repos, running tests, and so on.


![alt text](https://files.helpdocs.io/i5nl071jo5/articles/qr4h6kn6yd/1632730923440/j-zhbga-hi-0-ozkc-g-4-d-8-b-qh-0-trfl-hsjxx-0-a-w-4-q-3-umnc-omcn-2-b-jb-ll-sw-1-ie-jw-hl-abaf-5-z-seq-6-g-04-nw-02-pva-wy-simv-igej-dcf-evxa-zjq-qhp-31-h-6-nbxpr-te-l-phdh-iwtytds-lg-1-n-1-a-s-0)


### Shared Path

You can use Shared Paths in a Stage to share data across Steps. By default, all Steps in a Stage use the same Workspace to share data. By default, `/harness` is the shared working directory for a Stage. For example, the Maven m2 repo is stored in `/root/.m2` by default. You can specify this same path in later Stages.

If you need to share additional volumes, you can add Shared Paths.


### Service Dependency

A Service Dependency enables multiple Stages to access the same service. For example, your Pipeline might include unit tests that require a running Redis server. Service Dependencies run in an isolated container so you don't need to handle dependencies.

See [Configure Service Dependency](https://docs.harness.io/article/vo4sjbd09g-configure-service-dependency-step-settings)


### Background Tasks

This step allows running commands in the background. It can spin up service dependencies as a part of the build.


### Matrix support

Matrix gives developers the ability to execute the same set of tasks multiple times for a bunch of different configurations with a simple elegant syntax, rather than duplicating the task for each configuration.


### Plugins

Plugins are Docker containers that perform predefined tasks and are configured as Steps in your Stage. You can use Plugins to deploy code, publish artifacts, send notifications, and more.

The Drone community maintains an extensive library of plugins for specific CI workflows. You can customize and extend your build processes using existing plugins or write your own.

See Plugin Step Settings and Run a Drone Plugin in CI.

### Caching

Caching ensures faster job execution by reusing data from expensive fetch operations in previous jobs. You can use Save Cache and Restore Cache steps to save a cache to a cloud storage bucket and restore it later. See Cache CI Data.

### Remote Docker Layer Caching

Harness enables remote Docker Layer Caching where each Docker layer is uploaded as an image to a Docker repo you identify. If the same layer is used in subsequent builds, Harness downloads the layer from the Docker repo.

This is different from other CI vendors that are limited to local caching and persistent volumes.

You can also specify the same Docker repo for multiple Build and Push steps, enabling them to share the same remote cache.

Remote Docker Layer Caching can dramatically improve build time by sharing layers across Pipelines, Stages, and steps.

### Artifact Repos

Harness CIE offers popular object storage options such as JFrog, Amazon S3, and Google GCS where you can push your artifacts. Object storage repos are set up as Pipeline Steps by using the Upload Artifacts step from the Step library.

### Services

A Service represents your microservices, Serverless functions, and other workloads logically. You can deploy, monitor, or change each Service independently.
When you add a Service to a Stage, the Service Definition represents the real artifacts, manifests, and variable settings of that Service. You can propagate or override a Service in later Stages of the Pipeline.

### Infrastructure Definition

Infrastructure Definitions represent the Kubernetes build infrastructure used by a CI pipeline: the target clusters, hosts, and so on.


### Connectors

Connectors contain the information necessary to integrate and work with third-party tools such as Git providers and artifact repos. For example, a GitHub Connector authenticates with a GitHub account and repo and fetches files as part of a deploy Stage. Harness uses Connectors at Pipeline runtime to authenticate and run operations in external tools.


### Delegates

The Harness Delegate is a software service you install in your environment that connects to the Harness Manager and performs tasks using your container orchestration platforms, artifact repositories, monitoring systems, and so on.

The Delegate also needs permissions in the target environment to execute build tasks. These permissions are granted in the Delegate config file or your environment account when installing the Delegate.


### Variables

You can add and reference custom variables in Pipelines and Stages. They're available across the Pipeline. You can propagate and override their values in later stages.


### Triggers

You can run your Pipelines manually or use triggers to initiate their execution. You can trigger a Pipeline based on Git commits and pull requests, schedules, and so on.
