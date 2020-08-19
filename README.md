# dKron running on Docker

This is the project to run DKron distributed scheduler on docker.

###### Packages included in the Docker image
* Python 3.6
* Ansible 2.9
* dKron 3.0.4

###### Synopsis
Docker is built with Centos 8 as base image and includes the above packages. Upon docker run, dkron agent will startup and an API POST call is made to **/v1/jobs** endpoint for creating a scheduled job to be run every 10 seconds running the **date** command!

###### How to build and run
&nbsp;
*Building the image:*
```
git clone https://github.com/skbasetti/dkron-setup.git
cd dkron-setup
sudo docker build -t dkron .
```
*Running the container:*
```
sudo docker run -d -it --name=dkron-container -p 8080:8080 dkron
```
*dKron dashboard will be available at the below URL*
```
http://localhost:8080/dashboard/
```

