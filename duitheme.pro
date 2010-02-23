TEMPLATE = subdirs

# Install rules
base.files = ./base
base.path = /usr/share/themes
base.CONFIG += no_check_exist
base.commands += perl extract.pl base/dui/svg/

devel.files = ./devel
devel.path = /usr/share/themes
devel.CONFIG += no_check_exist

devel_preload.files = ./devel/dui/libdui/preload.list
devel_preload.path = $$devel.path/devel/dui
devel_preload.depends = devel
devel.commands += perl extract.pl devel/dui/svg/

plankton.files = ./plankton
plankton.path = /usr/share/themes
plankton.CONFIG += no_check_exist
plankton.commands += perl extract.pl plankton/dui/svg/

plankton_preload.files = ./plankton/dui/libdui/preload.list
plankton_preload.path = $$plankton.path/plankton/dui
plankton_preload.depends = plankton

INSTALLS += base \
            devel \
            devel_preload \
            plankton \
            plankton_preload \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
