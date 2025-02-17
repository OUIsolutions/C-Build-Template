
local image = darwin.ship.create_machine("debian:latest")

image.start({
    flags = {"-it"},
    volumes = {
        { "./release", "/release" },
    },
})