FROM centos:8
COPY conf/dkron.repo /etc/yum.repos.d/dkron.repo
COPY conf/supervisord.conf /etc/
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && yum install dkron supervisor python3 python3-pip ansible supervisor -y
EXPOSE 8080
CMD ["/usr/bin/supervisord"]
