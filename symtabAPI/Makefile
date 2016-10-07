#
#  SymtabAPI Makefile.
#
#  $Id$
#
include ../Makefile.conf

PKG_NAME = symtabAPI

PREREQS = binutils boost libelf libdwarf

PLATFORM := $(SYMTABAPI_PLATFORM)
export PLATFORM

SRC_DIR = dyninst
FETCH_COPY_FILES = cmake/optimization.cmake
BUILD_SUBDIRS = common elf dwarf symtabAPI instructionAPI parseAPI

# Temporary options to allow using an alternate Dyninst source tree.

ifneq ($(ALT_DYN_SRC_TREE),no)

FETCH_CMD = ./fetch-copy $(ALT_DYN_SRC_TREE)
PATCH_DIR = patches
POST_FETCH_CMD = ./post-fetch

else
ifneq ($(ALT_DYN_TAR_FILE),no)

FETCH_TARFILE = $(ALT_DYN_TAR_FILE)
PATCH_DIR = patches
POST_FETCH_CMD = ./post-fetch

else

FETCH_TARFILE = dyninst-lite-9.1.0.tar.bz2
PATCH_DIR = patches-910

endif
endif

include ../build-utils/Makefile.inc
