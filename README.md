![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)
![Docker](https://img.shields.io/badge/dockerhub-images-important.svg?logo=LOGO)


# Summary
This template builds a docker image :whale: and publishes to [DockerHub](https://hub.docker.com/) or [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry), using GitHub Actions.

# How to use

* Customize the code of `Dockerfile`
* Prepare a docker host: [DockerHub](https://hub.docker.com/) or a token for [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
* Customize the build-push action in `.github/workflows/docker-image.yaml`, in particular:
    * use correct DockerHub credentials and add them to your [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), as `DOCKER_USER` and `DOCKER_PASSWORD` for DockerHub and `PAT` for Container Registry, respectively.
    * make sure that `IMAGE_NAME` matches the repo name on DockerHub
* The workflow is (by default) run either when the code of the docker file or action script gets changed, or when triggered manually.

# Note

This repo has been created for educational purposes. Building and publishing docker image is here done with direct Docker commands, but can be also automatized with [dedicated GitHub Actions](https://github.com/docker/build-push-action).