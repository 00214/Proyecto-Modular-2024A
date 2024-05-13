# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kiri_description: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ikiri_description:/home/kiri/kiri_ws/src/kiri_description/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kiri_description_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_custom_target(_kiri_description_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kiri_description" "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kiri_description
  "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kiri_description
)

### Generating Services

### Generating Module File
_generate_module_cpp(kiri_description
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kiri_description
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kiri_description_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kiri_description_generate_messages kiri_description_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_dependencies(kiri_description_generate_messages_cpp _kiri_description_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kiri_description_gencpp)
add_dependencies(kiri_description_gencpp kiri_description_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kiri_description_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(kiri_description
  "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kiri_description
)

### Generating Services

### Generating Module File
_generate_module_eus(kiri_description
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kiri_description
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kiri_description_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kiri_description_generate_messages kiri_description_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_dependencies(kiri_description_generate_messages_eus _kiri_description_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kiri_description_geneus)
add_dependencies(kiri_description_geneus kiri_description_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kiri_description_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kiri_description
  "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kiri_description
)

### Generating Services

### Generating Module File
_generate_module_lisp(kiri_description
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kiri_description
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kiri_description_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kiri_description_generate_messages kiri_description_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_dependencies(kiri_description_generate_messages_lisp _kiri_description_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kiri_description_genlisp)
add_dependencies(kiri_description_genlisp kiri_description_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kiri_description_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(kiri_description
  "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kiri_description
)

### Generating Services

### Generating Module File
_generate_module_nodejs(kiri_description
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kiri_description
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kiri_description_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kiri_description_generate_messages kiri_description_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_dependencies(kiri_description_generate_messages_nodejs _kiri_description_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kiri_description_gennodejs)
add_dependencies(kiri_description_gennodejs kiri_description_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kiri_description_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kiri_description
  "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kiri_description
)

### Generating Services

### Generating Module File
_generate_module_py(kiri_description
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kiri_description
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kiri_description_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kiri_description_generate_messages kiri_description_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kiri/kiri_ws/src/kiri_description/msg/kiri_controller_data.msg" NAME_WE)
add_dependencies(kiri_description_generate_messages_py _kiri_description_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kiri_description_genpy)
add_dependencies(kiri_description_genpy kiri_description_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kiri_description_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kiri_description)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kiri_description
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kiri_description_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kiri_description)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kiri_description
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(kiri_description_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kiri_description)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kiri_description
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kiri_description_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kiri_description)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kiri_description
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(kiri_description_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kiri_description)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kiri_description\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kiri_description
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kiri_description_generate_messages_py std_msgs_generate_messages_py)
endif()
