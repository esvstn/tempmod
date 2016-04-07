# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y


ifeq ($(DEBUG),y)
  D_FLAGS = -O -g -D__DEBUG__ # "-O" is needed to expand inlines
else
  D_FLAGS = -O2
endif

EXTRA_CFLAGS += $(D_FLAGS)
EXTRA_CFLAGS += -I..

ifneq ($(KERNELRELEASE),)
# call from kernel build system

obj-m	:= dumb.o

else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

endif



clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

depend .depend dep:
	$(CC) $(EXTRA_CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
