# container-minecraft-server [WIP]

A KISS minecraft server container image inspired by [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server)

Available architectures: amd64, arm64

## Usage

How do I setup podman? Read [this](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md)

### Running the image

```sh
podman run -d -it \
    --restart unless-stopped \
    --user 1000:0 \
    --label io.containers.autoupdate=image \
    -p 25565:25565 \
    -e EULA=TRUE \
    -e MEMORY=1G \
    -e TYPE=VANILLA \
    -e VERSION=LATEST \
    -v path/to/minecraft/data:/data \
    --name mc \
    ghcr.io/mq1/container-minecraft-server:latest
```

### Setting up autostart with systemd

```sh
podman generate systemd --new --files --name mc
mkdir -p ~/.config/systemd/user
mv container-mc.service ~/.config/systemd/user
podman container stop mc && podman container rm mc
systemctl --user enable --now container-mc.service
```

## Parameters

Parameter | Function | Default
--- | --- | ---
-e EULA=TRUE | The minecraft server EULA [TRUE\|FALSE] | FALSE
-e MEMORY | The RAM allocated to the server | 1G
-e TYPE | The server implementation [VANILLA\|PAPER\|FABRIC] | VANILLA
-e VERSION | The Minecraft version [LATEST\|1.X.X] | LATEST
-v /data | Minecraft data location |

© 2021 Manuel Quarneti
