local rpm_static_build_done = false
function rpm_static_build()
    if rpm_static_build_done then
        return
    end
    rpm_static_build_done = true

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
    os.execute("mkdir -p .cache/rpm/RPMS")

    local image = darwin.ship.create_machine("fedora:latest")
    image.add_comptime_command("sudo dnf install rpm-build rpmdevtools -y")
    image.add_comptime_command("sudo dnf install gcc -y")
    image.add_comptime_command("rpmdev-setuptree")
    image.start({
        flags = {
            "-it "
        },
        volumes = {
            { ".cache/rpm/SOURCES", "/root/rpmbuild/SOURCES" },
            { ".cache/rpm/SPECS",   "/root/rpmbuild/SPECS" },
            { ".cache/rpm/RPMS",    "/root/rpmbuild/RPMS" }
        },
        command = "rpmbuild -ba ~/rpmbuild/SPECS/" .. PROJECT_NAME .. ".spec"
    })

    local rpms = darwin.dtw.list_files_recursively(".cache/rpm/RPMS", true)
    for _, file in ipairs(rpms) do
        if darwin.dtw.ends_with(file, ".rpm") then
            darwin.dtw.copy_any_overwriting(file, "release/" .. PROJECT_NAME .. ".rpm")
        end
    end
end
