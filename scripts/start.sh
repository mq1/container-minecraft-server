#!/bin/sh

echo "eula=${EULA}" > eula.txt

[ "$TYPE" = "PAPER" ] && /scripts/paper.sh
