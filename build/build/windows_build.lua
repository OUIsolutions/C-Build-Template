function windows_build()
    local image = darwin.ship.create_machine("debian:latest")
    image.add_comptime_command("apt-get update")
    image.add_comptime_command("apt-get -y install mingw-w64")

    image.start({
        volumes = {
            { RELEASE_DIR, "/release" }
        },
        command = WINDOWS_COMPILATION
    })
end
