#!/bin/sh

versionManifestUrl=$(wget -qO- 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq --arg VERSION "$VERSION" -r '.versions[] | select(.id == $VERSION).url')
serverDownloadUrl=$(wget -qO- $versionManifestUrl | jq -r '.downloads.server.url' )
server="minecraft_server.${VERSION}.jar"

[[ -f $server ]] || wget -O $server $serverDownloadUrl

# Remove old versions
for f in minecraft_server.*.jar; do
    [[ $f != $server ]] && rm $f
done

/scripts/launch.sh $server
