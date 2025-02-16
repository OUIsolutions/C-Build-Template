---@class Darwin
darwin = darwin

local build_funcs = {
    amalgamation_build = amalgamation_build,
    alpine_static_build = alpine_static_build,
    windows_build = windows_build
}

function main()
    darwin.dtw.remove_any("release")
    darwin.dtw.remove_any(".cache")
    for name, buld_lambda in pairs(build_funcs) do
        if darwin.argv.one_of_args_exist(name) then
            buld_lambda()
        end
    end
end
