PROJECT_NAME       = "calc"
CONTANIZER         = "docker"
START_POINT        = "src/main.c"
RELEASE_DIR        = "./release"
OUTPUT_SINGLE_FILE = PROJECT_NAME .. ".c"
STATIC_LINUX_BIN   = PROJECT_NAME .. ".out"
WINDOWS_BIN        = PROJECT_NAME .. ".exe"
VERSION            = "1.0.0"
LICENSE            = "MIT"
URL                = "yor_domain.com"
DESCRIPITION       = "your description"
FULLNAME           = "your full name"
EMAIL              = "youremail"
SUMARY             = "your sumary "
ARQUITETURE        = "x86_64"
YOUR_CHANGES       = "your changes"


ALPINE_COMPILATION  = "gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
    " -o /release/" .. STATIC_LINUX_BIN

WINDOWS_COMPILATION = "i686-w64-mingw32-gcc --static " .. RELEASE_DIR .. "/" .. OUTPUT_SINGLE_FILE ..
    " -o /release/" .. WINDOWS_BIN



RPM_SPEC_TEMPLATE = [[
Name:           PROJECT_NAME
Version:        VERSION
Release:        1%{?dist}
Summary:        SUMARY
Source0:        amalgamated.c

License:        LICENSE
URL:           PROJECT_URL

BuildRequires:  gcc, make
Requires:       glibc

BuildRoot:      %{_tmppath}/%{name}-%{version}-buildroot
BuildArch:      ARQUITETURE

%description
DESCRIPITION

%prep


%build
gcc  %{_sourcedir}/amalgamated.c -o project.out


%install
mkdir -p %{buildroot}/usr/local/bin
cp %{_builddir}/project.out   %{buildroot}/usr/local/bin/PROJECT_NAME

%files
/usr/local/bin/PROJECT_NAME

%changelog
* TIMEZONE - FULLNAME EMAIL  - 1.0.0-1
- YOUR_CHANGES
]]
