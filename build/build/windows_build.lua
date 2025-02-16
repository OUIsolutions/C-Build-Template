local windows_build_done = false
function windows_build()
    if windows_build_done then
        return
    end
    windows_build_done = false
    os.execute("mkdir -p release")

    local image = darwin.ship.create_machine("debian:latest")
    image.add_comptime_command("apt-get update")
    image.add_comptime_command("apt-get -y install mingw-w64")

    image.start({
        volumes = {
            { "./release", "/release" },
            { "./src",     "/src" }
        },
        command = "i686-w64-mingw32-gcc --static /src/main.c -o /release/windowsi32.exe"
    })
end
