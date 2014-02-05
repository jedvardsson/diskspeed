#!/bin/bash


PROG=$(basename $0)

showhelp() {
cat <<EOF
Simple util that test disk write and read speed using dd.

Usage: $PROG [options] directory...

        directory              directory to use when testing speed.

Examples:

    # Test disk speed in current directory
    $ $PROG
    Writing .: 251658240 bytes (252 MB) copied, 0.873465 s, 288 MB/s
    Reading .: 251658240 bytes (252 MB) copied, 0.0401338 s, 6.3 GB/s    

    # Test disk speed in two folders
    $ $PROG /dir/encrypted /dir/not_encrypted
    Writing /dir/encrypted: 251658240 bytes (252 MB) copied, 0.816196 s, 308 MB/s
    Reading /dir/encrypted: 251658240 bytes (252 MB) copied, 0.0390377 s, 6.4 GB/s
    Writing /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.45864 s, 549 MB/s
    Reading /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.0466736 s, 5.4 GB/s
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

