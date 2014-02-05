#!/bin/bash


PROG=$(basename $0)

showhelp() {
cat <<EOF
Simple util that test disk write and read speed using dd.

Usage: $PROG [options] directory...

        directory              directory to use when testing speed.

Examples:

    # Test disk speed in current directory
    $PROG

    # Test disk speed in users home directory
    $PROG \$HOME

    # Test disk speed in two folders
    $PROG /dir/encrypted /dir/not_encrypted
EOF
    exit;
}

for i
do
    case $1 in
        -h|--help) showhelp; exit 0;;
        -*) echo "Unknown option: $1"; exit 1;;
        *) break;;
    esac
done


if [ $# -eq 0 ]; then
	output_dirs="."
else
	output_dirs="$*"
fi


for output_dir in $output_dirs; do
    output_file=$(mktemp --tmpdir=$output_dir --suffix=.speed)
    if [ $? -ne 0 ]; then
    	echo "Cannot create temp file in $output_dir."
    	exit 1
    fi

    dd_args="bs=8k count=30k"

    echo -en "Writing $output_dir: "
    dd if=/dev/zero of=$output_file $dd_args 2>&1|tail -1

    echo -en "Reading $output_dir: "
    dd if=$output_file of=/dev/null $dd_args 2>&1|tail -1

    rm -f $output_file
done

