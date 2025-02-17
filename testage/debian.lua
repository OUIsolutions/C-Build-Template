
local image = darwin.ship.create_machine("debian:latest")
image.provider = "docker"

image.start({
    flags = {"-it"},
    volumes = {
        { "./release", "/release" },
    },
})