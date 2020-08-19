# Using base image centos:8
FROM centos:8
# Copying dKron yum repo config file to the image
COPY conf/dkron.repo /etc/yum.repos.d/dkron.repo
# Copying startup.sh to the image
COPY script/ /tmp/
# Installing required packages using YUM
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && yum install dkron python3 python3-pip ansible -y
# Exposing 8080 port to run the dashboard
EXPOSE 8080
# Running startup.sh on container startup
ENTRYPOINT ["/tmp/startup.sh"]
