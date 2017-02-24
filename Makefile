#
# Data Acquisition Tool for the V&A VA18B Multimeter
#
# Copyright (C) 2009  Martin Schewe  <multimeter@schewe.com>
#
# You always find the most recent version on http://multimeter.schewe.com.
# $Id: Makefile 9 2009-05-05 16:20:36Z ms $
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#


TOOL		= multimeter

PREFIX		= /usr/local
BINDIR		= $(PREFIX)/bin


all: $(BINARIES)

install: all
	install -o root -g root -m  755    $(TOOL)  $(BINDIR)

clean:

distclean: clean
	rm -fr {**/,}.svn
	rm -f {**/,}{*.rej,.*.swp}
