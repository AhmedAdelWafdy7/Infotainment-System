# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/benwafdy/ADAS_PROJ/Infotainment System"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/benwafdy/ADAS_PROJ/Infotainment System/build"

# Include any dependencies generated for this target.
include CMakeFiles/RemoteSpeaker.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/RemoteSpeaker.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/RemoteSpeaker.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/RemoteSpeaker.dir/flags.make

CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o: RemoteSpeaker_autogen/mocs_compilation.cpp
CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/build/RemoteSpeaker_autogen/mocs_compilation.cpp"

CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/build/RemoteSpeaker_autogen/mocs_compilation.cpp" > CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.i

CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/build/RemoteSpeaker_autogen/mocs_compilation.cpp" -o CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.s

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o: ../src/SPEAKER/RemoteSpeaker.cpp
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeaker.cpp"

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeaker.cpp" > CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.i

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeaker.cpp" -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.s

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o: ../src/SPEAKER/RemoteSpeakerStublmpl.cpp
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeakerStublmpl.cpp"

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeakerStublmpl.cpp" > CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.i

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/RemoteSpeakerStublmpl.cpp" -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.s

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o: ../src/SPEAKER/DataBuffer.cpp
CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/DataBuffer.cpp"

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/DataBuffer.cpp" > CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.i

CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src/SPEAKER/DataBuffer.cpp" -o CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.s

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o: ../src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp
CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp"

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp" > CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.i

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp" -o CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.s

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o: ../src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp
CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp"

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp" > CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.i

CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp" -o CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.s

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o: ../src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp
CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp"

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp" > CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.i

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp" -o CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.s

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o: CMakeFiles/RemoteSpeaker.dir/flags.make
CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o: ../src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp
CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o: CMakeFiles/RemoteSpeaker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o -MF CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o.d -o CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o -c "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp"

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp" > CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.i

CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/benwafdy/ADAS_PROJ/Infotainment System/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp" -o CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.s

# Object files for target RemoteSpeaker
RemoteSpeaker_OBJECTS = \
"CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o" \
"CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o"

# External object files for target RemoteSpeaker
RemoteSpeaker_EXTERNAL_OBJECTS =

RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/RemoteSpeaker_autogen/mocs_compilation.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeaker.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/RemoteSpeakerStublmpl.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src/SPEAKER/DataBuffer.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/proxy/v1/commonapi/IPCManagerSomeIPProxy.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src-gen/IPCManager/someip/common/v1/commonapi/IPCManagerSomeIPDeployment.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/stub/v1/commonapi/RemoteSpeakerSomeIPStubAdapter.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/src-gen/RemoteSpeaker/someip/common/v1/commonapi/RemoteSpeakerSomeIPDeployment.cpp.o
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/build.make
RemoteSpeaker: CMakeFiles/RemoteSpeaker.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable RemoteSpeaker"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RemoteSpeaker.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/RemoteSpeaker.dir/build: RemoteSpeaker
.PHONY : CMakeFiles/RemoteSpeaker.dir/build

CMakeFiles/RemoteSpeaker.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/RemoteSpeaker.dir/cmake_clean.cmake
.PHONY : CMakeFiles/RemoteSpeaker.dir/clean

CMakeFiles/RemoteSpeaker.dir/depend:
	cd "/home/benwafdy/ADAS_PROJ/Infotainment System/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/benwafdy/ADAS_PROJ/Infotainment System" "/home/benwafdy/ADAS_PROJ/Infotainment System" "/home/benwafdy/ADAS_PROJ/Infotainment System/build" "/home/benwafdy/ADAS_PROJ/Infotainment System/build" "/home/benwafdy/ADAS_PROJ/Infotainment System/build/CMakeFiles/RemoteSpeaker.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/RemoteSpeaker.dir/depend

