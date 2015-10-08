#
#  SymtabAPI Makefile.
#
#  $Id$
#
include ../Makefile.conf

PKG_NAME = symtabAPI

PREREQS = boost libelf libdwarf

PLATFORM := $(SYMTABAPI_PLATFORM)
export PLATFORM

ifeq ($(USE_SYMTAB_61),yes)

# SymtabAPI dropped support for ia64 after 6.1.

FETCH_TARFILE = symtab_src_6.1.tar.gz
SRC_DIR =   symtabAPI
BUILD_DIR = symtabAPI/src/dyninst
PATCH_DIR = patches-61
CONFIG_CMD = ./configure-61
INSTALL_CMD = $(BUILD_CMD)
PREREQS += libunwind libxml2

else

# New dyninst 9.0 with parseAPI support.

FETCH_TARFILE = DyninstAPI-9.0.3.tgz
SRC_DIR = DyninstAPI-9.0.3
PATCH_DIR = patches-90
FETCH_COPY_FILES = cmake/optimization.cmake
CONFIG_CMD = ./configure-90
BUILD_SUBDIRS = common elf dwarf symtabAPI instructionAPI parseAPI
PREREQS += binutils

endif

include ../build-utils/Makefile.inc
