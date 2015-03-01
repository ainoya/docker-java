# https://github.com/dockerfile/java/blob/master/oracle-java7/Dockerfile
# Pull base image.
FROM ubuntu:15.04

# Install Java.
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

CMD ["bash"]
