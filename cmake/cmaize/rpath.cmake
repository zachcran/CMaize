include_guard()

# From "Processional CMake: A Practical Guide" by Craig Scott, 
#      v1.0.0, 2018, https://crascit.com
# 
# Extends the $ORIGIN behavior to Apple systems as well
if(APPLE)
    list(APPEND CMAKE_INSTALL_RPATH
        "@loader_path/external/tmp"
    )
else()
    list(APPEND CMAKE_INSTALL_RPATH
        "$ORIGIN"
        "$ORIGIN/external/tmp"
    )
endif()

# Add the paths which point to dependencies outside the build tree to the
# install RPATH
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# # use, i.e. don't skip the full RPATH for the build tree
# set(CMAKE_SKIP_BUILD_RPATH FALSE)

# # when building, don't use the install RPATH already
# # (but later on when installing)
# set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
