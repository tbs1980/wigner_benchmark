# Try to find the library PolSpice
# See
# http://www2.iap.fr/users/hivon/software/PolSpice/
#
# Usage:
#   find_package(PolSpice [REQUIRED] [QUIET] )
#
# Once run this will define:
#
# PolSpice`_FOUND       = system has PolSpice lib
#
# PolSpice_LIBRARIES   = full path to the libraries
#
# PolSpice_INCLUDE_DIR      = where to find headers
#
# PolSpice_ROOT = search path
# --------------------------------

find_path(PolSpice_INCLUDE_DIR NAMES spice_common.mod PATHS ${PolSpice_ROOT} PATH_SUFFIXES include)

find_library(PolSpice_LIBRARIES NAMES libspice.a PATHS ${PolSpice_ROOT} PATH_SUFFIXES lib)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(PolSpice DEFAULT_MSG PolSpice_INCLUDE_DIR PolSpice_LIBRARIES)

mark_as_advanced(PolSpice_INCLUDE_DIR PolSpice_LIBRARIES)
