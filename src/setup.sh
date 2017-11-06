#!/bin/bash

#####  Create project  #####
mkdir -p /opt/dotnet/src/hello_dotnet
cd /opt/dotnet/src/hello_dotnet
dotnet new mvc --auth Individual --framework netcoreapp2.0

# mysql connection string
sed -i -e "s/DataSource=app.db/server=db;userid=testing;password=testing;database=testing;/g" ./appsettings.json


#####  Add package  #####
# Pomelo mysql library
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 2.0.0
sed -i -e "s/options.UseSqlite/options.UseMySql/g" ./Startup.cs

# Official mysql library - not works
# dotnet add package MySql.Data.EntityFrameworkCore --version 8.0.9-dmr
# sed -i -e "s/options.UseSqlite/options.UseMySQL/g" ./Startup.cs

# xunit
dotnet add package dotnet-xunit --version 2.3.0


#####  Build & Run  #####
dotnet publish --runtime centos.7-x64 --output bin/publish
systemctl restart dotnet.service


#####  DB migrate  #####
dotnet ef database update


#####  Create xunit project  #####
cd /opt/dotnet/src
dotnet new xUnit --output hello_dotnet.test --framework netcoreapp2.0
dotnet add hello_dotnet.test/hello_dotnet.test.csproj reference hello_dotnet/hello_dotnet.csproj


#####  Create sln file  #####
dotnet new sln --name hello_dotnet
dotnet sln add **/*.csproj
