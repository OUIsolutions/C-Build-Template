---@class Darwin
darwin = darwin

function main()
    darwin.dtw.remove_any("release")
    darwin.dtw.remove_any(".cache")
    amalgamation_build()
    alpine_static_build()
    windows_build()
    rpm_static_build()
end
