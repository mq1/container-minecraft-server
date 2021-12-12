#!/bin/sh

echo Downloading fabric

[ "$VERSION" = LATEST ] && VERSION=$(wget -qO- "https://meta.fabricmc.net/v2/versions/game" | jq -r '[.[] | select(.stable == true).version][0]')

latestVersion=$(wget -qO- "https://meta.fabricmc.net/v2/versions/installer" | jq -r .[0].version)
fabricInstaller="fabric-installer-${latestVersion}.jar"
fabricInstallerUrl="https://maven.fabricmc.net/net/fabricmc/fabric-installer/${latestVersion}/${fabricInstaller}"

# Download the fabric installer jar
wget -O "$fabricInstaller" "$fabricInstallerUrl"

# Run the installer
java -jar "$fabricInstaller" server -mcversion "$VERSION" -downloadMinecraft

# Delete the installer
rm "$fabricInstaller"

# Launch fabric-server-launch.jar
/scripts/launch.sh fabric-server-launch.jar
