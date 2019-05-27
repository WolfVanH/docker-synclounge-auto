#!/bin/sh

cd /opt/synclounge

export accessUrl=https://$DOMAIN; npm run server & node webapp.js
