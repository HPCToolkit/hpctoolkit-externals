#!/bin/sh
#
# Make an elfutils-lite tar file for externals's distfiles and trim
# the following subdirs (keep Makefile.* for configure).  We don't use
# them for hpctoolkit, so this saves space in the git repo.
#
#   src     (except for Makefile.*)
#   tests   (except for Makefile.*)
#   .git
#
# Usage: unpack an elfutils tar file and run:
#
#   mk-elfutils-lite.sh  directory  [version]
#

exclude_list='.git src/*.c tests/*.c tests/*.sh tests/*.bz2'

die() {
    echo "error: $@"
    exit 1
}

dir="$1"
version="$2"

test -d "$dir" || die "not a directory: $dir"

if test "x$version" = x ; then
    base=`basename "$dir"`
    version=`expr "$base" : 'elfutils-\(.*\)'`
fi
tar_file="elfutils-lite-${version}.tar"

set --

for f in $exclude_list ; do
    set -- "$@" --exclude "$f"
done

set -- "$@" "$dir"

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
