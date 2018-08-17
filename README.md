# docker-synclounge-auto
The official SyncLounge container with autojoin enabled for your custom domain

```
docker run \
  --name=SyncLounge \
	-p 8088:8088 \
	-p 8089:8089 \
  -e DOMAIN=example.com \
  -e autoJoin=[true/false] \
  -e webroot=slweb \
  -e serverroot=slserver \
  -e autoJoinServer=https://example.com/slserver
  rix1337/docker-synclounge-auto
```

With the environment variables, this script will ensure, your local clients never see the server selection, and instead will be connected to your local SyncLounge server every time. Only works, if DOMAIN is accessible through https. See below for how to do set up nginx (just add the location blocks to your server block listening on 443):

 ```
 	location /slweb {
 		proxy_pass http://localhost:8088/slweb;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location /slserver {
 		proxy_pass http://localhost:8089/slserver;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}
```
