function alpine_static_build()
    local image = darwin.ship.create_machine("alpine:latest")
    image.add_comptime_command("apk update")
    image.add_comptime_command("apk add --no-cache gcc musl-dev curl")

    image.start({
        volumes = {
            { RELEASE_DIR, "/release" }
        },
        command = ALPINE_COMPILATION
    })
end
