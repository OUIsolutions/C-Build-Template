
local image = darwin.ship.create_machine("fedora:latest")

image.start({
    flags = {"-it"},
    volumes = {
        { "./release", "/release" },
    },
})