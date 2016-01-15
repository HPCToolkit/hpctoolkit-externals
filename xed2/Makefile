#
#  Xed2 Makefile.
#
#  $Id$
#
include ../Makefile.conf

PKG_NAME = xed2

ifeq ($(XED2_TYPE),x86-64)
#
# 64-bit x86_64
# uses both static (.a) and dynamic (.so) libxed
#
FETCH_TARFILE = xed-install-base-2015-09-10-lin-x86-64.zip  \
		xed-install-base-static-2015-09-17-lin-x86-64.zip
SRC_DIR = kits

else
ifeq ($(XED2_TYPE),x86-32)
#
# 32-bit i386
#
FETCH_TARFILE = xed-install-base-2015-09-10-lin-ia32.zip
SRC_DIR = kits

else
ifeq ($(XED2_TYPE),k1om)
#
# k1om, Xeon Phi (KNC)
# libirc is only needed on k1om
#
libirc_src = ../distfiles/libirc.a.gz
libirc_dest = extras/xed2-mic/lib/libirc.a

FETCH_TARFILE = pin-extras-2.12-58423-k1om.tar.gz
POST_FETCH_CMD = gzip -d <"$(libirc_src)" >"$(libirc_dest)"
SRC_DIR = extras

else
FETCH_CMD = true

endif
endif
endif

CONFIG_CMD = true
BUILD_CMD = true
INSTALL_CMD = ./install

include ../build-utils/Makefile.inc
