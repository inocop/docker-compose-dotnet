FROM centos:7.3.1611

MAINTAINER inocop

RUN yum -y install yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf

# install apache
RUN yum -y install httpd

# enable service
RUN systemctl enable httpd.service

# install dotnet
RUN yum -y install libunwind libicu
WORKDIR /tmp
RUN curl -sSL -o dotnet.tar.gz https://aka.ms/dotnet-sdk-2.0.0-linux-x64
RUN mkdir -p ~/dotnet && tar zxf dotnet.tar.gz -C ~/dotnet
RUN export PATH=$PATH:$HOME/dotnet

# exec
CMD ["/sbin/init"]
