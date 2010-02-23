TEMPLATE = subdirs

# Install rules

# BASE THEME
base.files = ./base
base.path = /usr/share/themes
base.CONFIG += no_check_exist
base.commands += perl extract.pl base/dui/svg/


# DEVEL THEME
devel.files = ./devel
devel.path = /usr/share/themes
devel.CONFIG += no_check_exist
devel.commands += perl extract.pl devel/dui/svg/

devel_icon.files = ./devel/dui/icons/icon-l-duitheme-devel.svg
devel_icon.path = /usr/share/themes/base/dui/icons
devel_icon.CONFIG += no_check_exist



# PLANKTON THEME
plankton.files = ./plankton
plankton.path = /usr/share/themes
plankton.CONFIG += no_check_exist
plankton.commands += perl extract.pl plankton/dui/svg/

plankton_icon.files = ./plankton/dui/icons/icon-l-duitheme-plankton.svg
plankton_icon.path = /usr/share/themes/base/dui/icons
plankton_icon.CONFIG += no_check_exist

INSTALLS += base \
            devel \
            devel_icon \
            plankton \
            plankton_icon \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
