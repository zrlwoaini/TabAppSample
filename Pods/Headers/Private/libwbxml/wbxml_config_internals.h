#ifndef WBXML_CONFIG_INTERNALS_H
#define WBXML_CONFIG_INTERNALS_H
#include "wbxml_config.h"
#define HAVE_DLFCN_H 1
#define HAVE_EXPAT 1
#define HAVE_ICONV 1
#define HAVE_INTTYPES_H 1
#define HAVE_LIMITS_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define PACKAGE "libwbxml"
#define PACKAGE_BUGREPORT "opensync-users@lists.sf.net"
#define PACKAGE_NAME "libwbxml"
#define PACKAGE_STRING "libwbxml 0.11.2"
#define PACKAGE_TARNAME "libwbxml"
#define PACKAGE_VERSION "0.11.2"
#define STDC_HEADERS 1
#define VERSION "0.11.2"
#if defined(HAVE_EXPAT)
#include <expat.h>
#endif
#if defined(HAVE_ICONV)
#include <iconv.h>
#endif
#endif
