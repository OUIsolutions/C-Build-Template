---@class Darwin
darwin = darwin

local build_funcs = {
    amalgamation_build = amalgamation_build,
    alpine_static_build = alpine_static_build,
    rpm_static_build = rpm_static_build,
    windowsi32_build = windowsi32_build,
    windowsi64_build = windowsi64_build,
    debian_static_build = debian_static_build,

}

function main()
    darwin.dtw.remove_any("release")
    darwin.dtw.remove_any(".cache")
    local i = 1
    for name, buld_lambda in pairs(build_funcs) do
        if darwin.argv.one_of_args_exist(name) then
            print("\n=========================================================================================")
            print("\tstarted of build:", i, "\n")
            buld_lambda()
            print("\n\tA build [" .. i .. "] finished")
            print("=========================================================================================\n\n")
            i = i + 1
        end
    end
end
