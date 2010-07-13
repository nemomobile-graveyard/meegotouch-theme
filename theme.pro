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
# install gconf schema
    unix {
        schemas.CONFIG += no_check_exist
        schemas.files = $${IN_PWD}/utils/meegotouchtheme.schemas
        schemas.path = $${M_SYSCONFDIR}/gconf/schemas
        schemas.commands = GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) gconftool-2 --makefile-install-rule $${IN_PWD}/utils/meegotouchtheme.schemas
        INSTALLS += schemas
        }


# BASE THEME
base.files = ./base
base.path = $$THEME_DIR
base.CONFIG += no_check_exist
base.commands += perl extract.pl base/meegotouch/svg/ base/meegotouch/ids.txt
base_icon.files = ./base/meegotouch/icons/icon-l-meegotouchtheme-devel.svg
base_icon.path = $$THEME_DIR/base/meegotouch/icons
base_icon.CONFIG += no_check_exist

# PLANKTON THEME
plankton.files = ./plankton
plankton.path = $$THEME_DIR
plankton.CONFIG += no_check_exist
plankton.commands += perl extract.pl plankton/meegotouch/svg/ base/meegotouch/ids.txt

plankton_icon.files = ./plankton/meegotouch/icons/icon-l-meegotouchtheme-plankton.svg
plankton_icon.path = $$THEME_DIR/base/meegotouch/icons
plankton_icon.CONFIG += no_check_exist

INSTALLS += base \
            base_icon \
            plankton \
            plankton_icon \

QMAKE_CLEAN += build-stamp configure-stamp
QMAKE_DISTCLEAN += build-stamp configure-stamp
