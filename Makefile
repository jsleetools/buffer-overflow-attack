#
#-----------------------------------------------------------------------------
#
# JUNGFO's simple Makefile
# Copyright (c) since 2020 jungfo@naver.com Technology.
# All rights reserved.
#
#-----------------------------------------------------------------------------
#
# Makefile
#

TARGET= stack
SRCS= stack.c
OBJS= $(SRCS:.c=.o)

L_CPPFLAGS=
L_INCFLAGS= -I./
L_CFLAGS= 
L_LDFLAGS=
L_LDLIBS= 

CPPFLAGS+= $(L_CPPFLAGS) $(L_INCFLAGS)
CFLAGS+= $(L_CFLAGS) 
LDFLAGS+= $(L_LDFLAGS) $(L_LDLIBS)

.PHONY: all
all: build

.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS) $(DEPEND_FILE) core* 

.PHONY: distclean
distclean: clean


.PHONY: depend
depend: $(SRCS)
	$(CC) -M $(CFLAGS) $(CPPFLAGS) $^ > $(DEPEND_FILE)

-include $(DEPEND_FILE)