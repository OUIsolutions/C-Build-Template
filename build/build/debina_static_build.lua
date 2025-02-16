local debian_static_build_done =  false
function debian_static_build()
    if debian_static_build_done then
        return
    end
    debian_static_build_done = true
    alpine_static_build()


    local control = [[
Package: PROJECT_NAME
Version: VERSION
Section: base
Priority: optional
Architecture: x86_64
Depends: libc6 (>= 2.27)
Maintainer: FULLNAME EMAIL
Description: SUMARY
]]

    control = string.gsub(control, "PROJECT_NAME", PROJECT_NAME)
    control = string.gsub(control, "VERSION", VERSION)
    control = string.gsub(control, "SUMARY", SUMARY)
    control = string.gsub(control, "FULLNAME", FULLNAME)
    control = string.gsub(control, "EMAIL", EMAIL)


    darwin.dtw.write_file(".cache/debian_static_build/project/DEBIAN/control", control)
 
    darwin.dtw.copy_any_overwriting(
        
    "release/alpine_static_bin.out",
    '.cache/debian_static_build/project/usr/local/bin/alpine_static_bin.out'
    )

  
    local image = darwin.ship.create_machine("debian:latest")

    image.start({
        volumes = {
            { ".cache/debian_static_build/project",     "/project" }
        },
        command = "dpkg-deb --build /project"
    })
end 