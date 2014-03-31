# qr-avatar - a claws-mail plugin

PREFIX		:= /usr
PLUGINDIR	:= $(PREFIX)/lib/claws-mail/plugins/
CC		:= gcc
INSTALL		:= install
RM		:= rm
CFLAGS		+= -O2 -Wall -Werror -shared -fPIC
CFLAGS		+= $(shell pkg-config --cflags --libs libqrencode)
CFLAGS		+= $(shell pkg-config --cflags --libs gtk+-2.0)
CFLAGS		+= -I/usr/include/claws-mail/ -I/usr/include/claws-mail/common/
CFLAGS		+= $(shell pkg-config --cflags gtk+-2.0)

all: qr-avatar.so

qr-avatar.so: qr-avatar.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o qr-avatar.so qr-avatar.c

install: qravatar.so
	$(INSTALL) -D -m0755 qr-avatar.so $(DESTDIR)$(PLUGINDIR)/qr-avatar.so

clean:
	$(RM) -f *.o *~ qr-avatar.so

distclean:
	$(RM) -f *.o *~ qr-avatar.so

