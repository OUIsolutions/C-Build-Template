function alpine_static_build()
    local image = darwin.ship.create_machine("alpine:latest")
    image.add_comptime_command("apk update")
    image.add_comptime_command("apk add --no-cache gcc musl-dev curl")

    image.start({
        volumes = {
            { RELEASE_DIR, "/release" }
        },
        command =
            "gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
            " -o /release/" .. STATIC_LINUX_BIN
    })
end
