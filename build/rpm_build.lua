function rpm_static_build()
    darwin.dtw.copy_any_overwriting(RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE, ".cache/rpm/SOURCES/amalgamated.c")
    local formmatted_rpm = RPM_SPEC_TEMPLATE
    formmatted_rpm = string.gsub(formmatted_rpm, "PROJECT_NAME", PROJECT_NAME)
    formmatted_rpm = string.gsub(formmatted_rpm, "VERSION", VERSION)
    formmatted_rpm = string.gsub(formmatted_rpm, "SUMARY", SUMARY)

    formmatted_rpm = string.gsub(formmatted_rpm, "LICENSE", LICENSE)
    formmatted_rpm = string.gsub(formmatted_rpm, "DESCRIPITION", DESCRIPITION)
    formmatted_rpm = string.gsub(formmatted_rpm, "PROJECT_URL", URL)
    formmatted_rpm = string.gsub(formmatted_rpm, "ARQUITETURE", ARQUITETURE)
    formmatted_rpm = string.gsub(formmatted_rpm, "FULLNAME", FULLNAME)
    formmatted_rpm = string.gsub(formmatted_rpm, "TIMEZONE", os.date("%a %b %d %Y"))

    formmatted_rpm = string.gsub(formmatted_rpm, "EMAIL", EMAIL)
    formmatted_rpm = string.gsub(formmatted_rpm, "YOUR_CHANGES", YOUR_CHANGES)



    darwin.dtw.write_file(".cache/rpm/SPECS/" .. PROJECT_NAME .. ".spec", formmatted_rpm)


    local image = darwin.ship.create_machine("fedora:latest")
    image.add_comptime_command("sudo dnf install rpm-build rpmdevtools -y")
    image.add_comptime_command("sudo dnf install gcc -y")
    image.add_comptime_command("rpmdev-setuptree")
    image.start({
        flags = {
            "-it"
        },
        volumes = {
            { ".cache/rpm/SOURCES", "/root/rpmbuild/SOURCES" },
            { ".cache/rpm/SPECS",   "/root/rpmbuild/SPECS" }
        },
        command = "rpmbuild -ba ~/rpmbuild/SPECS/" .. PROJECT_NAME .. ".spec"

    })
end
