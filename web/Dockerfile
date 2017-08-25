FROM centos:7.3.1611

MAINTAINER inocop

# install sudo, yum-plugin-fastestmirror
RUN yum install -y sudo cronie yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf

# add admin
RUN useradd admin && echo "admin:admin" | chpasswd
RUN usermod -u 1000 admin && groupmod -g 1000 admin
RUN echo "admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 

# switch user
USER admin

# apache install
RUN sudo yum install -y httpd
RUN sudo systemctl enable httpd.service
RUN sudo mkdir -p /var/www/html/dotnet
RUN sudo chmod -R 2775 /var/www/html/
RUN sudo gpasswd -a admin apache

# install dotnet
RUN sudo yum -y install libunwind libicu
WORKDIR /tmp
RUN curl -sSL -o dotnet.tar.gz https://aka.ms/dotnet-sdk-2.0.0-linux-x64
RUN mkdir -p ~/dotnet && tar zxf dotnet.tar.gz -C ~/dotnet
RUN sudo ln -s ~/dotnet/dotnet /usr/local/bin

# exec
CMD ["/sbin/init"]
