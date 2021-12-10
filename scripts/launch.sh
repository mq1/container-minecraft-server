#!/bin/sh

java "-Xms${MEMORY}" "-Xmx${MEMORY}" -jar "$1" --nogui
