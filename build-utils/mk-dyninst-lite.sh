#!/bin/sh
#
# Make a dyninst-lite tar file for externals's distfiles and exclude
# the following subdirs.  We don't use them for hpctoolkit, so this
# saves space in the git repo.
#
#   doc
#   .git
#
# Usage: clone a dyninst repository, checkout some version and run:
#
#   mk-dyninst-lite.sh  directory  [version]
#

exclude_list='doc .git'

die() {
    echo "error: $@"
    exit 1
}

dir="$1"
version="$2"

test -d "$dir" || die "not a directory: $dir"

if test "x$version" != x ; then
    tar_file="dyninst-lite-${version}.tar"
else
    tar_file="dyninst-lite.tar"
fi

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
