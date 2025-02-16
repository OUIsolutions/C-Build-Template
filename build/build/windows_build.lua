local windows_build_done = false
function windows_build()
    if windows_build_done then
        return
    end
    windows_build_done = false

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
