include(cmaize/cmaize_impl)
include(cmaize/rpath)

# Automatically create a CMaizeProject instance if CMake project
# has already been defined before CMaize was included
cmaize_project("${PROJECT_NAME}")
