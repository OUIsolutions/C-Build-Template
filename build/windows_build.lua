function windows_build()
    local image = darwin.ship.create_machine("debian:latest")
    image.add_comptime_command("apt-get update")
    image.add_comptime_command("apt-get -y install mingw-w64")

    image.start({
        volumes = {
            { RELEASE_DIR, "/release" }
        },
        command =
            "i686-w64-mingw32-gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
            " -o /release/" .. WINDOWS_BIN
    })
end
