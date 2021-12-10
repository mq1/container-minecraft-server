#!/bin/sh

echo Downloading paper

build=$(wget -qO- "https://papermc.io/api/v2/projects/paper/versions/${VERSION}" | jq '.builds[-1]')
server=$(wget -qO- "https://papermc.io/api/v2/projects/paper/versions/${VERSION}/builds/${build}" | jq -r '.downloads.application.name')

[ -f "$server" ] || wget -O "$server" "https://papermc.io/api/v2/projects/paper/versions/${VERSION}/builds/${build}/downloads/${server}"

# Remove old versions
for f in paper-*.jar; do
    [ "$f" != "$server" ] && rm "$f"
done

/scripts/launch.sh "$server"
