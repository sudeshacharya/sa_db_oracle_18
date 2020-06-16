#!/bin/bash

# Download the oracle instance
svn checkout https://github.com/oracle/docker-images/trunk/OracleDatabase/SingleInstance/dockerfiles/$1

# Get build script
wget https://raw.githubusercontent.com/oracle/docker-images/master/OracleDatabase/SingleInstance/dockerfiles/buildDockerImage.sh

# Execute the Oracle Image build script
bash buildDockerImage.sh -v $1 -x

# Build the image
docker build -t oracle-18xe .

#Tag the build


#Run the container
docker run -d -p 1521:1521 oracle-18xe