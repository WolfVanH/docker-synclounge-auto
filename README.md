# docker-plextogether-autojoin
The official plextogether container with autojoin enabled for your custom domain

```
docker run \
  --name=plextogether \
	-p 8088:8088 \
	-p 8089:8089 \
  -e DOMAIN=example.com \
  -e AUTOJOIN \
  rix1337/docker-plextogether-autojoin
```

With the  AUTOJOIN variable, this script will ensure, your local clients never see the server selection, and instead will be connected to your local PlexTogether server every time. Only works, if DOMAIN is accessible through https. See below for how to do set up nginx:

#### To run both the Plex Together webapp and the Plex Together server through a web server like nginx you will need to make sure you proxy websockets. Example nginx.conf:

 ```
 server {
     listen 80;
 	server_name example.com;
 	root /location/of/plextogether/;
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
 	location / {
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 		proxy_pass http://localhost:8088/ptweb;
 	}
 }
```
