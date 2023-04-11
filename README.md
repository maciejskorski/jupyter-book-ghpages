![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)
![Docker](https://img.shields.io/badge/dockerhub-images-important.svg?logo=LOGO)
![build](https://github.com/maciejskorski/jupyter-book-ghpages/actions/workflows/docker-image.yaml/badge.svg)
![tests](https://github.com/maciejskorski/jupyter-book-ghpages/actions/docker-test-jupyterbook.yaml/badge.svg)
![Docker Size](https://img.shields.io/docker/image-size/maciejskorski/jupyter-book-gh)
![Docker Pulls](https://img.shields.io/docker/pulls/maciejskorski/jupyter-book-gh)

# Summary

This repo provides a docker to build and deploy [jupyter-book](https://jupyterbook.org/en/stable/intro.html) to GitHub pages, with extensions such as [plantuml support](https://www.plantuml.com/). 

The image is available on [DockerHub](https://hub.docker.com/r/maciejskorski/jupyter-book-gh) and on [GitHub Container Registry](???).

# How to use

Use the image to build documentation and publish to GitHub Pages. This is a workflow example:
```
name: docs-docker

on: [push, pull_request, workflow_dispatch]

jobs:
  docs:
    runs-on: ubuntu-latest
    container: maciejskorski/jupyter-book-gh:latest
    steps:
      - uses: actions/checkout@v2
      - name: Compile Docs
        run: |
          jupyter-book build docs
      - name: Deploy to gh-pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_branch: gh-pages
          publish_dir: ./docs/_build/html
```

See it [used live here](https://maciejskorski.github.io/software_engineering/).