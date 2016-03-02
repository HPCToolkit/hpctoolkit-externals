#
#  Binutils Makefile.
#
#  $Id$
#
include ../Makefile.conf

PKG_NAME = binutils

ifeq ($(USE_NEW_BINUTILS),yes)

FETCH_TARFILE = binutils-2.26.tar.bz2
SRC_DIR = binutils-2.26
PATCH_DIR = patches-26
AC_CONFIG_DIR = .
CONFIG_CMD = ./configure-26
POST_INSTALL_CMD = ./post-install-26
BUILD_SUBDIRS = intl libiberty zlib bfd opcodes binutils

else

FETCH_TARFILE = binutils-2.20.1-hpc-r117.tar.gz
SRC_DIR = version-binutils-2.20.1
AC_CONFIG_DIR = binutils-2.20.1
POST_INSTALL_CMD = ./post-install
BUILD_SUBDIRS = libiberty bfd opcodes intl binutils

endif

include ../build-utils/Makefile.inc
