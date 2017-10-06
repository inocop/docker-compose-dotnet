#!/bin/bash

# create project
cd /opt/dotnet/src/hello_dotnet
dotnet new mvc --auth Individual --framework netcoreapp2.0

# mysql connection string
sed -i -e "s/DataSource=app.db/server=db;userid=testing;password=testing;database=testing;/g" ./appsettings.json

# official mysql library - not works
# dotnet add package MySql.Data.EntityFrameworkCore --version 8.0.9-dmr 
# sed -i -e "s/options.UseSqlite/options.UseMySQL/g" ./Startup.cs

# Pomelo mysql library
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 2.0.0
sed -i -e "s/options.UseSqlite/options.UseMySql/g" ./Startup.cs

# build & start
dotnet restore
dotnet build -o /opt/dotnet/bin/
systemctl restart dotnet.service

# db migrate
dotnet ef database update
