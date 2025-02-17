# C-Build-Template
A build template to compile single unit compilation projects, in:
- **.deb**
- **.rpm**
- **linux executable**
- **windows 32 bits executable**
- **windows 64 bits executable**

## Requirements
### Darwin
install [Darwin](https://github.com/OUIsolutions/Darwin) on
version **0.020** with:
```bash
curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.020/darwin.out -o darwin.out && sudo chmod +x darwin.out &&  sudo  mv darwin.out /usr/bin/darwin
```
### Docker or Podman
and you also will also need to **PODMAN** or **DOCKER**  to build the packages
(yo can edit these here on **CONTANIZER** var [Config](/build/config.lua)

## Build
to build all the packages, just fork these repo,  put all your code into **src** dir
(note that your code must compile with **gcc --static main.c**) and build everything with:
```bash
darwin run_blueprint build/ --mode folder amalgamation_build alpine_static_build windowsi32_build windowsi64_build rpm_static_build debian_static_build

```
### Configure build
you can configure every aspect of the build in [Config](/build/config.lua) 
### Build Flags
each build its a  Lua function that matchs a flag,note that your function must be runnable 
by darwin runtine check [Darwin Api Usage](https://github.com/OUIsolutions/Darwin/blob/main/docs/api_usage.md)


| flag               | output                  | what its                                | Function                  |
|--------------------|-------------------------|----------------------------------------|---------------------------|
| amalgamation_build | release/amalgamation.c  | a C file with all the code in one file |[Function implementation](/build/build/amalgamation_build.lua)    |
| alpine_static_build| release/alpine_static   | a linux executable with musl           |[Function implementation](/build/build/alpine_static_build.lua)   | 
| windowsi32_build   | release/windowsi32.exe  | a windows 32 bits executable            |[Function implementation](/build/build/windowsi32_build.lua)      |
| windowsi64_build   | release/windows64.exe  | a windows 64 bits executable            |[Function implementation](/build/build/windows64_build.lua)      |
| rpm_static_build   | release/rpm_static.rpm  | a rpm package with musl                 |[Function implementation](/build/build/rpm_static_build.lua)      |
| debian_static_build| release/debian_static.deb| a debian package with musl              |[Function implementation](/build/build/debian_static_build.lua)   |

## Add your own build
to add your build flag just create a function in [build](/build/build) dir and add it:[Build Funcs](/build/build_funcs.lua)
