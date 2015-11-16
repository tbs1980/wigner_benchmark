# Try to find the library WignerSymbols
# See
# https://github.com/valandil/wignerSymbols
#
# Usage:
#   find_package(WignerSymbols [REQUIRED] [QUIET] )
#
# Once run this will define:
#
# WignerSymbols`_FOUND       = system has WignerSymbols lib
#
# WignerSymbols_LIBRARIES   = full path to the libraries
#
# WignerSymbols_INCLUDE_DIR      = where to find headers
#
# WignerSymbols_ROOT = search path
# --------------------------------

find_path(WignerSymbols_INCLUDE_DIR NAMES wignerSymbols.h PATHS ${WignerSymbols_ROOT} PATH_SUFFIXES include)

find_library(WignerSymbols_LIBRARIES NAMES libwignerSymbols.so PATHS ${WignerSymbols_ROOT} PATH_SUFFIXES lib)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(WignerSymbols DEFAULT_MSG WignerSymbols_INCLUDE_DIR WignerSymbols_LIBRARIES)

mark_as_advanced(WignerSymbols_INCLUDE_DIR WignerSymbols_LIBRARIES)
