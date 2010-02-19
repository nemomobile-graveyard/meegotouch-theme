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

rd.files = ./rd
rd.path = /usr/share/themes
rd.CONFIG += no_check_exist
rd.commands += perl extract.pl rd/dui/svg/

rd_preload.files = ./devel/dui/libdui/preload.list
rd_preload.path = $$rd.path/rd/dui
rd_preload.depends = rd

INSTALLS += base \
            devel \
            devel_preload \
            rd \
            rd_preload \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
