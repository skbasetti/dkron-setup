FROM centos:8
COPY conf/dkron.repo /etc/yum.repos.d/dkron.repo
COPY script/ /tmp/
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && yum install dkron python3 python3-pip ansible -y

EXPOSE 8080
ENTRYPOINT ["/usr/bin/dkron", "agent", "&"]
