# docker-synclounge-auto
The official SyncLounge container with autojoin enabled for your custom domain

```
docker run \
  --name=plextogether \
	-p 8088:8088 \
	-p 8089:8089 \
  -e DOMAIN=example.com \
  -e AUTOJOIN \
  rix1337/docker-plextogether-autojoin
```

With the  AUTOJOIN variable, this script will ensure, your local clients never see the server selection, and instead will be connected to your local SyncLounge server every time. Only works, if DOMAIN is accessible through https. See below for how to do set up nginx (just add the location blocks to your server block listening on 443):

 ```
 	location /ptweb {
 		proxy_pass http://localhost:8088/ptweb;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location /ptserver {
 		proxy_pass http://localhost:8089/ptserver;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}
```
