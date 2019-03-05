#!/bin/bash
set -e # exit on error

function print_synopsis {
	echo "$0 [options]"
	echo "    -h, --help       print this help message and exit."
	echo "    --URL            original URL to download from"
	echo "    --SHA1           SHA1 of the archive to download"
	echo "    --PACKAGE        name of the package to download"
	echo "    --VERSION        version of the package to download"
	echo "    -o,--output-dir  output directory to create structure and download file into"
}

# https://stackoverflow.com/a/14203146
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )
while [[ $# -gt 0 ]]
do
	key="$1"
case $key in
	-h|--help)
		print_synopsis
		exit 0
	;;
	--URL)
		if [[ $# -lt 2 ]]; then
			echo "'$key' needs one argument"
			echo ""
			print_synopsis
			exit 1
		fi
		pkg_url="$2"
		shift # past argument
	;;
	--SHA1)
		if [[ $# -lt 2 ]]; then
			echo "'$key' needs one argument"
			echo ""
			print_synopsis
			exit 1
		fi
		pkg_sha1="$2"
		shift # past argument
	;;
	--PACKAGE)
		if [[ $# -lt 2 ]]; then
			echo "'$key' needs one argument"
			echo ""
			print_synopsis
			exit 1
		fi
		pkg_name="$2"
		shift # past argument
	;;
	--VERSION)
		if [[ $# -lt 2 ]]; then
			echo "'$key' needs one argument"
			echo ""
			print_synopsis
			exit 1
		fi
		pkg_version="$2"
		shift # past argument
	;;
	-o|--output-dir)
		if [[ $# -lt 2 ]]; then
			echo "'$key' needs one argument"
			echo ""
			print_synopsis
			exit 1
		fi
		output_dir="$2"
		shift # past argument
	;;
	*)
		# unknown option
		echo "error: unknown option '$key'"
		echo ""
		print_synopsis
		exit 1
    ;;
esac
shift # past argument or value
done

# check for mandatory parameter
if [ -z ${pkg_url+x} ]; then
	echo "parameter '--URL' is mandatory"
	echo ""
	print_synopsis
	exit 1
fi
if [ -z ${pkg_sha1+x} ]; then
	echo "parameter '--SHA1' is mandatory"
	echo ""
	print_synopsis
	exit 1
fi
if [ -z ${pkg_name+x} ]; then
	echo "parameter '--PACKAGE' is mandatory"
	echo ""
	print_synopsis
	exit 1
fi
if [ -z ${pkg_version+x} ]; then
	echo "parameter '--VERSION' is mandatory"
	echo ""
	print_synopsis
	exit 1
fi

# if output directory is set check if it exists
if [ ! -z ${output_dir+x} ]; then
	if [ ! -d "${output_dir}" ]; then
		echo "output directory does not exist: \"${output_dir}\""
		exit 1
	fi
	# let output dir end with /
	case ${output_dir} in
		*/)
			# echo "all good, nothing to do"
		;;
		*)
			output_dir="${output_dir}/"
		;;
	esac
fi

# show every executed command
set -x

# use first 7 characters of SHA1 as archive-ID
pkg_archive_id="${pkg_sha1:0:7}"
# define directory structure
pkg_target_structure="${output_dir}${pkg_name}/${pkg_version}/${pkg_archive_id}"
# extract filename from download URL
pkg_target_filename=$(basename "$pkg_url" | sed -e 's/[!@#$%^&*?]/_/g')

mkdir -p "$pkg_target_structure"
wget "$pkg_url" -O "${pkg_target_structure}/${pkg_target_filename}" --no-check-certificate

