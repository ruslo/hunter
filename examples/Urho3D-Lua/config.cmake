# DOCUMENTATION_START {
# config.cmake

hunter_config(
    Urho3D
    VERSION ${HUNTER_Urho3D_VERSION}
    CMAKE_ARGS URHO3D_LUA=ON
)

hunter_config(Lua VERSION 5.1.5-p1)
# DOCUMENTATION_END }
