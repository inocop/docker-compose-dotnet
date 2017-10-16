## Start 
```
$ git clone https://github.com/inocop/docker-dotnet.git
$ cd docker-dotnet
$ docker-compose up -d
$ docker exec -it docker-dotnet_web_1 bash
[root@docker]# /opt/dotnet/src/setup.sh
```

## Rebuild
```
$ cd docker-dotnet/src
$ ./rebuild_from_host.sh
```
or  

Visual Studio Code > task.json > publish

## Test
```
$ cd docker-dotnet/src/hello_dotnet.test
$ dotnet test 
```
or  

Visual Studio Code > task.json -> xUnit

## Browse

### dotnet application
http://localhost:8080

### adminer
http://localhost:8080/tools/adminer.php
