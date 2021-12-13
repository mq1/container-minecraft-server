#!/bin/sh

echo Downloading fabric

[ "$VERSION" = LATEST ] && VERSION=$(wget -qO- "https://meta.fabricmc.net/v2/versions/game" | jq -r '[.[] | select(.stable == true).version][0]')

loaderVersion=$(wget -qO- "https://meta.fabricmc.net/v2/versions/loader/${VERSION}" | jq -r '.[] | select(.loader.stable == true).loader.version')
installerVersion=$(wget -qO- "https://meta.fabricmc.net/v2/versions/installer" | jq -r .[0].version)

server="fabric-server-mc.${VERSION}-loader.${loaderVersion}-launcher.${installerVersion}.jar"

# Download the fabric installer jar
[ -f "$server" ] || wget -O "$server" "https://meta.fabricmc.net/v2/versions/loader/${VERSION}/${loaderVersion}/${installerVersion}/server/jar"

# Remove old versions
for f in fabric-server-mc.*-loader.*-launcher.*.jar; do
    [ "$f" != "$server" ] && rm "$f"
done

# Launch server jar
/scripts/launch.sh "$server"
