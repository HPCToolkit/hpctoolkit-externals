#!/bin/sh
#
# Make a tar file of boost libs and tools.  We add this to
# boost-headers to build selected boost libraries.
#
# Usage: unpack boost tar file (or git clone) and run:
#
#   mk-boost-libs.sh  directory  [version]
#

exclude_files='doc quickbook'
lib_files='Jamfile.v2 config atomic chrono date_time filesystem system thread timer'

die() {
    echo "error: $@"
    exit 1
}

dir="$1"
version="$2"

test -d "$dir" || die "not a directory: $dir"

if test "x$version" = x ; then
    base=`basename "$dir"`
    version=`expr "$base" : 'boost_\(.*\)'`
fi
tar_file="boost-libs_${version}.tar"

set --

for f in $exclude_files ; do
    set -- "$@" --exclude "$f"
done

for f in $lib_files ; do
    set -- "$@" "${dir}/libs/$f"
done

set -- "$@" "${dir}/tools"

echo "making tar file: $tar_file ..."

rm -f "$tar_file" "${tar_file}.bz2"

echo
echo tar cf "$tar_file" "$@"

tar cf "$tar_file" "$@"
test $? -eq 0 || die "tar failed"

bzip2 "$tar_file"
test $? -eq 0 || die "bzip2 failed"

echo
ls -lh "${tar_file}.bz2"
