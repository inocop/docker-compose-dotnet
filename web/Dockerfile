FROM centos:7.3.1611

MAINTAINER inocop


# install yum-plugin-fastestmirror
RUN yum install -y yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf


# apache install
RUN yum install -y httpd
RUN systemctl enable httpd.service
COPY ./dotnet.conf /etc/httpd/conf.d/dotnet.conf


# install dotnet
RUN yum -y install libunwind libicu
WORKDIR /tmp
RUN curl -sSL -o dotnet.tar.gz https://aka.ms/dotnet-sdk-2.0.0-linux-x64
RUN mkdir -p /opt/dotnet/sdk2.0.0 
RUN tar zxf dotnet.tar.gz -C /opt/dotnet/sdk2.0.0 
RUN ln -s /opt/dotnet/sdk2.0.0/dotnet /usr/local/bin

# exec
CMD ["/sbin/init"]
