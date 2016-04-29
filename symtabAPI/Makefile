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

FETCH_TARFILE = dyninst-git.tar.gz
SRC_DIR = dyninst
PATCH_DIR = patches-90
FETCH_COPY_FILES = cmake/optimization.cmake
CONFIG_CMD = ./configure-90
BUILD_SUBDIRS = common elf dwarf symtabAPI instructionAPI parseAPI

include ../build-utils/Makefile.inc
