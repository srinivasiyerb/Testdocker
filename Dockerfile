FROM      ubuntu
MAINTAINER srinivas srinivas.iyer@relevancelab.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y apache2



RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-org

RUN apt-get install -y openssh-server


EXPOSE 80 22 27017

CMD ["service", "mongod", "start"]

