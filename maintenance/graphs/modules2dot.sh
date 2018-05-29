#!/bin/bash
set -e

####################
# global variables #
####################

# subdirectories to keep working dir clean
DOT_DIR="_dot"
PNG_DIR="_png"
# base name of files to create
dot_basename="modules"
# name of dot-file to create
DOT_FILE="${DOT_DIR}/${dot_basename}.dot"
# name of png-file to create
PNG_FILE="${PNG_DIR}/${dot_basename}.png"

# to keep the graph simple the following modules are omited
excluded_modules=(
	hunter_status_print
	hunter_status_debug
	hunter_user_error
	hunter_internal_error
	hunter_fatal_error
	hunter_wiki
	hunter_assert_not_empty_string
)


#############
# functions #
#############

# function to print usage message
function print_usage() {
	echo "Usage:"
	echo "${1} module-dir"
	echo "  module-dir ... path to folder which contains hunter module files (for example ../../cmake/modules)"
}

# check if a given module is one of the excluded ones
function is_excluded_module {
	#return 1
	local _mod="$1"
	local is_excluded=1 #false
	for excluded in "${excluded_modules[@]}"
	do
		if [ "$excluded" == "${_mod}" ]; then
			local is_excluded=0 #true
			break
		fi
	done
	return $is_excluded
}


########
# main #
########

# module directory is mandatory
if [ -z "$1" ]; then
	echo "argument error: module-dir is mandatory!"
	print_usage $0
	exit 1
fi

# modules dir
modules_dir="$1"

# create subdirs if needed
if [ ! -d "${DOT_DIR}" ]; then
	mkdir "${DOT_DIR}"
fi
if [ ! -d "${PNG_DIR}" ]; then
	mkdir "${PNG_DIR}"
fi

echo "digraph hunter_modules {" > ${DOT_FILE}
hunter_modules="${modules_dir}/hunter_*.cmake"
echo "expanding ${hunter_modules}"
for mod_file_full in $hunter_modules
do
	# module filename
	mod_file=$(basename "$mod_file_full")
	# module name
	module="${mod_file%.cmake}"
	echo "process module: ${module}"

	# don't draw excluded modules
	if is_excluded_module ${module} ; then
		continue
	fi

	# list of included hunter modules
	all_deps=$(awk -F'[()]' '/^include\(hunter_/ {print $2;}' "${modules_dir}/${mod_file}")

	# print module dependencies
	dep_printed=false
	for dep in ${all_deps[@]}
	do
		if ! is_excluded_module ${dep} ; then
			echo "  ${module} -> ${dep}" >> "${DOT_FILE}"
			dep_printed=true
		fi
	done
	# if module has no dependencies just print the module itself
	if [ "${dep_printed}" = false ]; then
		echo "  ${module}" >> "${DOT_FILE}"
	fi
done
echo "}" >> ${DOT_FILE}

echo "convert dotfile to png"
dot -Tpng ${DOT_FILE} -o ${PNG_FILE}
echo "done"
