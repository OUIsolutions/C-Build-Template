
local image = darwin.ship.create_machine("fedora:latest")
image.provider = "docker"
image.start({
    flags = {"-it"},
    volumes = {
        { "./release", "/release" },
    },
})