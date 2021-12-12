#!/bin/sh

echo Downloading fabric

versions=$(wget -qO- "https://maven.fabricmc.net/net/fabricmc/fabric-installer/maven-metadata.xml")
latestVersion=$(echo "$versions" | xmllint --xpath 'string(/metadata/versioning/release)' -)

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
