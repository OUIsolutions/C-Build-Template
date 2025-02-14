Name:           {PROJECT_NAME}
Version:        {VERSION}
Release:        1%{?dist}
Summary:        Um exemplo de pacote RPM

License:        {LICENSE}
URL:           {URL}
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch

%description
{DESCRIPITION}

%prep
# Extração dos arquivos do código-fonte
%setup -q

%build
# Se houver compilação, insira os comandos aqui

%install
mkdir -p %{buildroot}/usr/local/bin
cp meu_projeto.sh %{buildroot}/usr/local/bin/meu_projeto

%files
/usr/local/bin/meu_projeto

%changelog
* {TIMEZONE} - Seu Nome <seuemail@example.com> - 1.0.0-1
