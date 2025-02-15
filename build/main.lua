---@class Darwin
darwin = darwin

function main()
    darwin.dtw.remove_any(RELEASE_DIR)
    darwin.dtw.remove_any(".cache")
    local amalgamation_result = darwin.camalgamator.generate_amalgamation(START_POINT)
    darwin.dtw.write_file(RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE, amalgamation_result)
    alpine_static_build()
    windows_build()
    rpm_static_build()
end
