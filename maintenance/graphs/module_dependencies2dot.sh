#!/bin/bash
set -e

####################
# global variables #
####################

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

# array of already processed modules
processed_modules=()


#############
# functions #
#############

# function to print usage message
function print_usage() {
	echo "Usage:"
	echo "${1} module-file"
	echo "  module-file ... module file to parse (assumed to end with .cmake)"
}


# check if a given module is already processed
function is_processed_module {
	local _mod="$1"
	local is_processed=1 #false
	for proc_mod in "${processed_modules[@]}"
	do
		#echo "compare ${proc_mod} with ${_mod}"
		if [ "$proc_mod" == "${_mod}" ]; then
			local is_processed=0 #true
			break
		fi
	done
	return $is_processed
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

# recursively (DFS) print module dependencies
function print_dependencies {
	local _mod="$1"
	local _mod_dir="$2"
	local _mod_file="${_mod_dir}/${_mod}.cmake"
	#echo "processing: ${_mod}"

	# don't print excluded modules
	if is_excluded_module ${_mod} ; then
		return
	fi

	# stop recursion if module was printed before
	if is_processed_module ${_mod} ; then
		return
	fi

	# add current module to proccessed modules
	processed_modules+=($_mod)

	# list of included hunter modules
	local all_deps=$(awk -F'[()]' '/^include\(hunter_/ {print $2;}' "${_mod_file}")

	# print module dependencies
	local dep_printed=false
	for dep in ${all_deps[@]}
	do
		if ! is_excluded_module ${dep} ; then
			echo "  ${_mod} -> ${dep}"
			local dep_printed=true
			# recurse deeper
			print_dependencies ${dep} "${_mod_dir}"
		fi
	done
	# if module is a leaf (no dependencies) just print the node itself
	if [ "${dep_printed}" = false ]; then
		echo "  ${_mod}"
	fi
}


########
# main #
########

# module file is mandatory
if [ -z "$1" ]; then
	echo "argument error: module-file is mandatory!"
	print_usage $0
	exit 1
fi

# modules dir
modules_dir=$(dirname "$1")
# module filename
root_module_file=$(basename "$1")

# module to process
root_module="${root_module_file%.cmake}"

# subdirectories to keep working dir clean
DOT_DIR="_dot"
PNG_DIR="_png"
# base name of files to create
dot_basename="dep_graph_${root_module}"
# name of dot-file to create
DOT_FILE="${DOT_DIR}/${dot_basename}.dot"
# name of png-file to create
PNG_FILE="${PNG_DIR}/${dot_basename}.png"

# create subdirs if needed
if [ ! -d "${DOT_DIR}" ]; then
	mkdir "${DOT_DIR}"
fi
if [ ! -d "${PNG_DIR}" ]; then
	mkdir "${PNG_DIR}"
fi

# process root module and print output into dot-file
(
echo "digraph dep_graph_${root_module} {"
print_dependencies ${root_module} "${modules_dir}"
echo "}"
)  > "${DOT_FILE}"

# convert created dot-file to png
echo "convert dotfile to png"
dot -Tpng ${DOT_FILE} -o ${PNG_FILE}
echo "done"

