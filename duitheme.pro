TEMPLATE = subdirs

# Install rules

# BASE THEME
base.files = ./base
base.path = /usr/share/themes
base.CONFIG += no_check_exist
base.commands += perl extract.pl base/meegotouch/svg/


# DEVEL THEME
devel.files = ./devel
devel.path = /usr/share/themes
devel.CONFIG += no_check_exist
devel.commands += perl extract.pl devel/meegotouch/svg/

devel_icon.files = ./devel/meegotouch/icons/icon-l-duitheme-devel.svg
devel_icon.path = /usr/share/themes/base/meegotouch/icons
devel_icon.CONFIG += no_check_exist



# PLANKTON THEME
plankton.files = ./plankton
plankton.path = /usr/share/themes
plankton.CONFIG += no_check_exist
plankton.commands += perl extract.pl plankton/meegotouch/svg/

plankton_icon.files = ./plankton/meegotouch/icons/icon-l-duitheme-plankton.svg
plankton_icon.path = /usr/share/themes/base/meegotouch/icons
plankton_icon.CONFIG += no_check_exist

INSTALLS += base \
            devel \
            devel_icon \
            plankton \
            plankton_icon \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
