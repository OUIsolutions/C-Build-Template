PROJECT_NAME = "calc"
CONTANIZER   = "docker"
VERSION      = "1.0.0"
LICENSE      = "MIT"
URL          = "yor_domain.com"
DESCRIPITION = "your description"
FULLNAME     = "your full name"
EMAIL        = "youremail"
SUMARY       = "your sumary "
YOUR_CHANGES = "your changes"




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
