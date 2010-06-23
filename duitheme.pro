TEMPLATE = subdirs

# here we allow for setting of an install prefix:
#
# 1. if the PREFIX command line parameter is given like this:
#        qmake PREFIX=/usr/local/
#    then use it, else
# 2. if meegotouch_defines.prf can be found, use it, else
# 3. default to /usr/

!isEmpty( PREFIX ) {
    THEME_DIR = $$PREFIX/share/themes
} else {
    exists( $$[QMAKE_MKSPECS]/features/meegotouch_defines.prf ) {
        load(meegotouch_defines)
        THEME_DIR = $$M_THEME_DIR
    } else {
        THEME_DIR = /usr/share/themes
    }
}

# BASE THEME
base.files = ./base
base.path = $$THEME_DIR
base.CONFIG += no_check_exist
base.commands += perl extract.pl base/meegotouch/svg/ base/meegotouch/ids.txt


# DEVEL THEME
devel.files = ./devel
devel.path = $$THEME_DIR
devel.CONFIG += no_check_exist
devel.commands += perl extract.pl devel/meegotouch/svg/ base/meegotouch/ids.txt

devel_icon.files = ./devel/meegotouch/icons/icon-l-meegotouchtheme-devel.svg
devel_icon.path = $$THEME_DIR/base/meegotouch/icons
devel_icon.CONFIG += no_check_exist



# PLANKTON THEME
plankton.files = ./plankton
plankton.path = $$THEME_DIR
plankton.CONFIG += no_check_exist
plankton.commands += perl extract.pl plankton/meegotouch/svg/ base/meegotouch/ids.txt

plankton_icon.files = ./plankton/meegotouch/icons/icon-l-meegotouchtheme-plankton.svg
plankton_icon.path = $$THEME_DIR/base/meegotouch/icons
plankton_icon.CONFIG += no_check_exist

INSTALLS += base \
            devel \
            devel_icon \
            plankton \
            plankton_icon \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
