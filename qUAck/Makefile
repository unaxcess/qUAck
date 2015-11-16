# UNaXcess II Conferencing System
# (c) 1998 Michael Wood (mike@compsoc.man.ac.uk)
#
# Build file for qUAck and qUAckd

include ../Makefile.inc

CCFLAGS+=-I/usr/local/include/ncurses

include Makefile.spell

QUACKBIN=../bin/qUAck
QUACKLBIN=../bin/qUAck-leak
QUACKDBIN=../bin/qUAckd
QUACKWBIN=../bin/qUAckw
BINARY=$(QUACKBIN) $(QUACKLBIN) $(QUACKDBIN)
OBJS=CmdIO.o CmdInput.o CmdMenu.o CmdProcess.o CmdShow.o CmdTable.o ../client/CliUser.o ../client/CliFolder.o ../ua.o ../EDF/EDF.o ../EDF/EDFElement.o ../Conn/Conn.o ../Conn/EDFConn.o ../useful/useful.o ../useful/StackTrace.o
QUACKOBJS=$(OBJS) qUAck-unix.o qUAck.o
QUACKLOBJS=$(OBJS) qUAck-unix.o qUAck-leak.o ../useful/LeakTrace.o
QUACKDOBJS=$(OBJS) qUAck-daemon.o qUAckd.o
QUACKWOBJS=$(OBJS) qUAck-unixw.o qUAck.o

all:	$(BINARY)

clean:
	@\rm -f $(BINARY) $(QUACKOBJS) $(QUACKLOBJS) $(QUACKDOBJS) $(QUACKWOBJS)

incbuild.o:
	@../incbuild.sh

$(QUACKBIN):	incbuild.o $(QUACKOBJS)
	$(LD) -o $@ $(QUACKOBJS) $(LDFLAGS) -lncurses

$(QUACKLBIN):	$(QUACKLOBJS)
	$(LD) -o $@ $(QUACKLOBJS) $(LDFLAGS) -lncurses

$(QUACKDBIN):	$(QUACKDOBJS)
	$(LD) -o $@ $(QUACKDOBJS) $(LDFLAGS)
	
$(QUACKWBIN):	$(QUACKWOBJS)
	$(LD) -o $@ $(QUACKWOBJS) $(LDFLAGS) -lncursesw

CmdIO.o:	CmdIO.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h CmdIO.h CmdIO-common.h
CmdInput.o:	CmdInput.cpp ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdIO-common.h CmdInput.h
CmdMenu.o:	CmdMenu.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdInput.h CmdMenu.h CmdMenuHelp.h CmdProcess.h CmdShow.h ../client/CliFolder.h  ../client/CliUser.h qUAck.h 
CmdProcess.o:	CmdProcess.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h ../client/CliFolder.h ../client/CliUser.h CmdIO.h CmdMenu.h CmdInput.h CmdShow.h CmdProcess.h qUAck.h
CmdShow.o:	CmdShow.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdInput.h CmdMenu.h ../client/CliUser.h CmdShow.h CmdTable.h qUAck.h
CmdTable.o:	CmdTable.cpp ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdTable.h

qUAck-daemon.o:	qUAck-daemon.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdIO-common.h CmdInput.h CmdMenu.h qUAck.h
qUAck-unix.o:	qUAck-unix.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdIO-common.h CmdInput.h CmdMenu.h qUAck.h
qUAck-unixw.o:	qUAck-unix.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h CmdIO.h CmdIO-common.h CmdInput.h CmdMenu.h qUAck.h
	$(CC) $(CCFLAGS) -DBUILDWIDE -c $< -o $(@)

qUAck.o:	qUAck.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h ../client/CliFolder.h ../client/CliUser.h CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdProcess.h qUAck.h build.h
qUAck-leak.o:	qUAck.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h ../client/CliFolder.h ../client/CliUser.h CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdProcess.h qUAck.h build.h
	$(CC) $(CCFLAGS) -DLEAKTRACEON -c $< -o $(@)
qUAckd.o:	qUAck.cpp ../Conn/EDFConn.h ../EDF/EDF.h ../EDF/EDFElement.h ../useful/useful.h ../useful/StackTrace.h ../useful/LeakTrace.h ../ua.h ../client/CliFolder.h ../client/CliUser.h CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdProcess.h qUAck.h build.h
	$(CC) $(CCFLAGS) -DBUILDDAEMON -c $< -o $(@)

CmdIO.o:	CmdIO.cpp CmdIO.h CmdIO-common.h
CmdInput.o:	CmdInput.cpp ../ua.h CmdIO.h CmdInput.h CmdIO-common.h
CmdMenu.o:	CmdMenu.cpp ../ua.h CmdIO.h CmdInput.h CmdMenu.h CmdMenuHelp.h CmdProcess.h CmdShow.h qUAck.h
CmdProcess.o:	CmdProcess.cpp ../ua.h CmdIO.h CmdMenu.h CmdInput.h CmdShow.h CmdProcess.h qUAck.h
CmdShow.o:	CmdShow.cpp ../ua.h CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdTable.h qUAck.h
CmdTable.o:	CmdTable.cpp CmdIO.h CmdInput.h CmdMenu.h CmdShow.h CmdTable.h

include ../Makefile.dep
