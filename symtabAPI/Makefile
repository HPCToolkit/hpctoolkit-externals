#
#  SymtabAPI Makefile.
#
#  $Id$
#
include ../Makefile.conf

PKG_NAME = symtabAPI

PREREQS = binutils boost libelf

PLATFORM := $(SYMTABAPI_PLATFORM)
export PLATFORM

SRC_DIR = dyninst
BUILD_SUBDIRS = common elf dwarf symtabAPI instructionAPI parseAPI

FETCH_TARFILE = dyninst-lite-2018-10-20.tar.bz2

include ../build-utils/Makefile.inc
