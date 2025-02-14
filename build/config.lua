PROJECT_NAME = "c_builder_example"
CONTANIZER = "docker"
START_POINT = "src/main.c"
RELEASE_DIR = "./release"
OUTPUT_SINGLE_FILE = PROJECT_NAME .. ".c"
STATIC_LINUX_BIN = PROJECT_NAME .. ".out"
WINDOWS_BIN = PROJECT_NAME .. ".exe"
ALPINE_COMPILATION = "gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
    " -o /release/" .. STATIC_LINUX_BIN

WINDOWS_COMPILATION = "i686-w64-mingw32-gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
    " -o /release/" .. WINDOWS_BIN
