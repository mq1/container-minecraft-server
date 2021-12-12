#!/bin/sh

echo "eula=${EULA}" > eula.txt

[ "$TYPE" = "VANILLA" ] && /scripts/vanilla.sh
[ "$TYPE" = "PAPER" ] && /scripts/paper.sh
[ "$TYPE" = "FABRIC" ] && /scripts/fabric.sh
