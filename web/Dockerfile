FROM centos:7.3.1611

MAINTAINER inocop


# install yum-plugin-fastestmirror
RUN yum install -y yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf


# apache install
RUN yum install -y httpd mod_ssl mod_rewrite mod_proxy
RUN systemctl enable httpd.service
COPY ./dotnet.conf /etc/httpd/conf.d/dotnet.conf


# add db tools
RUN yum install -y wget unzip php php-mysqli php-mbstring which mysql
RUN mkdir -p /var/www/html/tools
RUN cd /var/www/html/tools && wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1.php
RUN mv /var/www/html/tools/adminer-4.3.1.php /var/www/html/tools/adminer.php


# install dotnet
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
RUN yum install -y libunwind libicu
RUN yum install -y dotnet-sdk-2.0.2
COPY ./dotnet.service /etc/systemd/system/dotnet.service
RUN systemctl enable dotnet.service


# insall node
WORKDIR /tmp
RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y nodejs gcc-c++ make git
RUN npm install -g bower


# insall debugger
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /opt/dotnet/vsdbg


# exec
CMD ["/sbin/init"]
