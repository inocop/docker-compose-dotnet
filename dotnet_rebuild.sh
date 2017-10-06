#!/bin/bash

docker exec dockerdotnet_web_1 systemctl stop dotnet.service
docker exec dockerdotnet_web_1 bash -c 'cd /opt/dotnet/src/hello_dotnet && dotnet build -o /opt/dotnet/bin/'
docker exec dockerdotnet_web_1 systemctl start dotnet.service