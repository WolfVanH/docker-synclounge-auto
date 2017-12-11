#!/bin/sh
cd /opt/plextogether
if [ ! -z ${AUTOJOIN+x} ]; then
	if [ ! -f autojoinenabled ]; then
		sed -i -e "s/autoJoin: false/autoJoin: true/g" /opt/plextogether/src/store.js
		sed -i -e "s/autoJoinUrl: null/autoJoinUrl: '$DOMAIN'/g" /opt/plextogether/src/store.js
		npm run build
		touch autojoinenabled
	fi
fi
npm run server & node webapp.js --url=https://$DOMAIN/ptweb
