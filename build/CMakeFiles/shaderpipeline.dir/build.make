# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.10.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.10.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build

# Include any dependencies generated for this target.
include CMakeFiles/shaderpipeline.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/shaderpipeline.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/shaderpipeline.dir/flags.make

CMakeFiles/shaderpipeline.dir/main.cpp.o: CMakeFiles/shaderpipeline.dir/flags.make
CMakeFiles/shaderpipeline.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/shaderpipeline.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/shaderpipeline.dir/main.cpp.o -c /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/main.cpp

CMakeFiles/shaderpipeline.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shaderpipeline.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/main.cpp > CMakeFiles/shaderpipeline.dir/main.cpp.i

CMakeFiles/shaderpipeline.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shaderpipeline.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/main.cpp -o CMakeFiles/shaderpipeline.dir/main.cpp.s

CMakeFiles/shaderpipeline.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/shaderpipeline.dir/main.cpp.o.requires

CMakeFiles/shaderpipeline.dir/main.cpp.o.provides: CMakeFiles/shaderpipeline.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/shaderpipeline.dir/build.make CMakeFiles/shaderpipeline.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/shaderpipeline.dir/main.cpp.o.provides

CMakeFiles/shaderpipeline.dir/main.cpp.o.provides.build: CMakeFiles/shaderpipeline.dir/main.cpp.o


# Object files for target shaderpipeline
shaderpipeline_OBJECTS = \
"CMakeFiles/shaderpipeline.dir/main.cpp.o"

# External object files for target shaderpipeline
shaderpipeline_EXTERNAL_OBJECTS =

shaderpipeline: CMakeFiles/shaderpipeline.dir/main.cpp.o
shaderpipeline: CMakeFiles/shaderpipeline.dir/build.make
shaderpipeline: glfw/src/libglfw3.a
shaderpipeline: glad/libglad.a
shaderpipeline: CMakeFiles/shaderpipeline.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable shaderpipeline"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/shaderpipeline.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/shaderpipeline.dir/build: shaderpipeline

.PHONY : CMakeFiles/shaderpipeline.dir/build

CMakeFiles/shaderpipeline.dir/requires: CMakeFiles/shaderpipeline.dir/main.cpp.o.requires

.PHONY : CMakeFiles/shaderpipeline.dir/requires

CMakeFiles/shaderpipeline.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/shaderpipeline.dir/cmake_clean.cmake
.PHONY : CMakeFiles/shaderpipeline.dir/clean

CMakeFiles/shaderpipeline.dir/depend:
	cd /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build /Users/mingrenchen/Desktop/csc418/computer-graphics-shader-pipeline/build/CMakeFiles/shaderpipeline.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/shaderpipeline.dir/depend

