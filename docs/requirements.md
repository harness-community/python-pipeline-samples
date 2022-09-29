### Make sure you have the following set up before you begin this tutorial:

- **Github Account:** This tutorial clones a codebase from a Github repo. You will need a Github account so Harness can connect to Github.
- **Docker Hub Account and Repo:** You will need to push and pull the image you build to Docker Hub. You can use any repo you want, or create a new one for this tutorial.
- **Kubernetes cluster for Harness Delegate and build farm:** You'll need a Kubernetes cluster for Harness to use for the Harness Delegate and as a build farm. Ensure you have a cluster that meets the following requirements:
- **Number of pods:** 3 (two pods for the Harness Delegate, the remaining pod for the build farm).
- **Machine type:** 4vCPU
- **Memory:** 16GB RAM. The build farm and Delegate requirements are low but the remaining memory is for Kubernetes, the Docker container, and other default services.
- **Networking:** Outbound HTTPS for the Harness connection, and to connect to Docker Hub. Allow TCP port 22 for SSH.
- **Namespace:** When you install the Harness Delegate, it will create the harness-delegate namespace. You'll use the same namespace for the build farm.
- A Kubernetes service account with permission to create entities in the target namespace is required. The set of permissions should include list, get, create, and delete permissions. In general, the cluster-admin permission or namespace admin permission is enough.

> For more information, see [User-Facing Roles](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles) from Kubernetes.
