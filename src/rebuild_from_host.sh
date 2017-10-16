#!/bin/bash

cd `dirname $0`
cd hello_dotnet/

dotnet publish --runtime centos.7-x64 --output bin/publish
docker exec dockerdotnet_web_1 systemctl restart dotnet.service
