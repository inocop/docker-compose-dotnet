## Environment
```
$ git clone https://github.com/inocop/docker-dotnet.git
$ cd docker-dotnet
$ docker-compose up -d
$ docker exec -it docker-dotnet_web_1 bash
[root@docker]# /opt/dotnet/src/setup.sh
```

## Rebuild
```
$ cd docker-dotnet
$ ./dotnet_rebuild.sh
```

## Show

### dotnet application
http://localhost:8080

### adminer
http://localhost:8080/tools/adminer.php
