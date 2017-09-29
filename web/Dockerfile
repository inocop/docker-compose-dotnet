FROM centos:7.3.1611

MAINTAINER inocop


# install yum-plugin-fastestmirror
RUN yum install -y yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf


# apache install
RUN yum install -y httpd mod_ssl mod_rewrite mod_proxy
RUN systemctl enable httpd.service
COPY ./dotnet.conf /etc/httpd/conf.d/dotnet.conf


# install dotnet
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
RUN yum install -y libunwind libicu
RUN yum install -y dotnet-sdk-2.0.0


COPY ./dotnet.service /etc/systemd/system/dotnet.service
RUN systemctl enable dotnet.service

# exec
CMD ["/sbin/init"]
