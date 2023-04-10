# build a light Java Runtime Environment tailored to run plantuml
FROM eclipse-temurin:17-alpine as java_docker
WORKDIR /usr/local/bin
COPY src/plantuml .
RUN chmod +x plantuml
RUN apk update && apk add wget \
    && wget http://sourceforge.net/projects/plantuml/files/plantuml-nodot.1.2023.5.jar/download -O plantuml.jar
RUN apk add binutils
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base,java.datatransfer,java.desktop,java.logging,java.prefs,java.scripting,java.xml  \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output ./jre

# move to a lightweight image and add other dependencies
FROM python:3.10-slim AS python_docker
WORKDIR /usr/local
COPY --from=java_docker /usr/local/bin/plantuml* ./bin/
COPY --from=java_docker /usr/local/bin/jre ./bin/jre
ENV PATH=$PATH:/usr/local/bin:/usr/local/bin/jre/bin
## git for deployment via GitHub Actions
RUN apt add --update git
## package for vector grrahics
RUN apk add --update graphviz
## package with fonts for off-screen rendering (https://hub.docker.com/r/bellsoft/liberica-openjre-alpine)
RUN apk add fontconfig ttf-dejavu
## linux headers
#RUN apk add build-base linux-headers
## Sphinx and UML Python packages
RUN pip install --upgrade pip
RUN pip install psutil \
    && pip install jupyter-book \
    && pip install sphinxcontrib-plantuml

LABEL description="A lightweight image to build jupyter-book with UML extensions and deploy to github pages."