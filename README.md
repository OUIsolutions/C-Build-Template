# C-Build-Template
A build template to compile single unit compilation projects, in:
- **.deb**
- **.rpm**
- **linux executable**
- **windows executable**
## Requirements
### Darwin
install [Darwin](https://github.com/OUIsolutions/Darwin) on
version **0.020** with:
```bash
curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.020/darwin.out -o darwin.out && sudo chmod +x darwin.out &&  sudo  mv darwin.out /usr/bin/darwin
```
### Docker or Podman
and you also will also need to **PODMAN** or **DOCKER**  to build the packages
(yo can edit these here on **CONTANIZER** var (Config)[/build/config.lua])

## Build
to build all the packages, just fork these repo,  put all your code into **src** dir
(note that your code must compile with **gcc --static main.c**) and build everything with:
```bash
darwin run_blueprint build/ --mode folder
```
## Configure build

you can configure every aspect of the build in [Config](/build/config.lua) , or if you prefer
you can edit the build code into [Main Start](/build/main.lua)  , check [Darwin](https://github.com/OUIsolutions/Darwin)
documentation for these.


## Extras
### Type anotations

to get type annotations just type:
```bash
darwin drop_types
```
