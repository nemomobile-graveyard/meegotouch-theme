#
# spec file for creating RPM packages from meegotouch-theme for MeeGo
#

Name:          meegotouch-theme
Summary:       Theme for Meego Touch based applications
Version:       0.20.2
Release:       1%{?dist}
Group:         User Interface/Desktops
License:       LGPL v2.1
BuildArch:     noarch
URL:           http://qt.gitorious.org/maemo-6-ui-framework/duitheme
Source0:       %{name}-%{version}.tar.bz2
# Source1:     mthemedaemon.desktop
# Source100:   meegotouch-theme-common.yaml

Requires:       libmeegotouch >= 0.20.0
BuildRequires:  pkgconfig(Qt)

%description
Theme required by any MeeGo Touch library based application.
Contains the base theme files and two alternative themes with a different look.


%prep
%setup -q -n %{name}-%{version}


%build
unset LD_AS_NEEDED
qmake-qt4 install_prefix=/usr

make %{?jobs:-j%jobs}


%install
rm -rf %{buildroot}

export INSTALL_ROOT=%{buildroot}
%make_install

# mkdir -p %{buildroot}/etc/xdg/autostart
# cp %{SOURCE1} %{buildroot}/etc/xdg/autostart


%files
%defattr(-, root, root, -)
/usr/share/themes/base
/usr/share/themes/devel
/usr/share/themes/plankton
# /etc/xdg/autostart/mthemedaemon.desktop


