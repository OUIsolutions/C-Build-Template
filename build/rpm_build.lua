function rpm_static_build()
    local rpm_spec_rendered = darwin.candango.Render_text(
        darwin.dtw.load_file("templates/rpm.spec")
    )
    if rpm_spec_rendered.exist_error then
        error(rpm_spec_rendered.error_message)
    end

    darwin.dtw.write_file("spec_cache.spec", rpm_spec_rendered.render_text)

    r = [[
    local image = darwin.ship.create_machine("fedora:latest")
        image.add_comptime_command("sudo dnf install rpm-build rpmdevtools -y")
        image.add_comptime_command("rpmdev-setuptree")
        image.start({
            volumes = {
                { RELEASE_DIR, "/release" }
            },
            command = ALPINE_COMPILATION
        })
    ]]
end
