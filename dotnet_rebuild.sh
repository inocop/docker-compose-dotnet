#!/bin/bash

docker exec dockerdotnet_web_1 systemctl stop dotnet.service
docker exec dockerdotnet_web_1 bash -c 'cd /opt/dotnet/src/hello_dotnet && dotnet restore'
docker exec dockerdotnet_web_1 bash -c 'cd /opt/dotnet/src/hello_dotnet && dotnet build --runtime centos.7-x64'
docker exec dockerdotnet_web_1 systemctl start dotnet.service
