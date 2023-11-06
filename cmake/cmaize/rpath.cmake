include_guard()

# Based on example from  "Processional CMake: A Practical Guide" by Craig Scott, 
# v1.0.0, 2018, https://crascit.com
# 
# Extends the $ORIGIN behavior to Apple systems as well
if(APPLE)
    if(BUILD_SHARED_LIBS)
        set(CMAKE_MACOSX_RPATH TRUE CACHE BOOL TRUE FORCE)
    else()
        set(CMAKE_MACOSX_RPATH FALSE CACHE BOOL FALSE FORCE)
    endif()
    set(_base_point @loader_path)
else()
    set(_base_point $ORIGIN)
endif()

# Append $ORIGIN and the "external/tmp" directory where dependency
# libraries are installed
set(
    CMAKE_INSTALL_RPATH
    "${CMAKE_INSTALL_RPATH}"
    "${_base_point}/external/tmp"
    CACHE STRING "" FORCE
)

# Based on example from CMake "RPATH handling" wiki at
# https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/RPATH-handling
# 
# Add the paths which point to dependencies outside the build tree to the
# install RPATH
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# use, i.e. don't skip the full RPATH for the build tree
set(CMAKE_SKIP_BUILD_RPATH FALSE)

# when building, don't use the install RPATH already
# (but later on when installing)
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
