FROM jupyter/base-notebook

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip openjdk-11-jdk && \
    apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
USER $NB_UID

COPY requirements.txt /home/jovyan/requirements.txt
WORKDIR /home/jovyan/project
COPY . .


RUN pip install --no-cache-dir -r /home/jovyan/requirements.txt && \
    rm /home/jovyan/requirements.txt