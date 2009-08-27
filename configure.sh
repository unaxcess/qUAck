#!/bin/sh

makeCheck()
{
test -e $1/Makefile
if [ $? = 0 ] ; then
	printf "\t\t%s\n" "cd $1 && make $2"
#else
#	printf "Does not exist\n" 1>&2
fi
}

doMakefile()
{
echo "# UNaXcess II Conferencing System"
echo "# (c) 1999 Michael Wood (mike@compsoc.man.ac.uk)"
echo "#"
echo "# Build file for sub directories (delete as appropriate)"
echo ""

DIRS=`find * -type d -maxdepth 0 -follow`

echo "all:"
for DIR in $DIRS
do
	if [ "$DIR" = "qUAck" ] ; then
		# echo Checking qUAck
		makeCheck qUAck ../bin/qUAck
	else
		makeCheck $DIR
	fi
done

echo ""

echo "clean:"
for DIR in $DIRS
do
	makeCheck $DIR clean
done

echo "install:"
for DIR in $DIRS
do
	makeCheck $DIR install
done
}

doSuffix()
{
printf "%s\n\t\t%s\n" ".$1.o:" "\$(CC) \$(CCFLAGS) -c $< -o \$(@)"
}

doMakefileInc()
{
arch=`uname | tr " " "-"`

cat << EOF
# UNaXcess II Conferencing System
# (c) 1999 Michael Wood (mike@compsoc.man.ac.uk)
#
# Makefile.inc: Common build options
#
# - To reduce warning output remove -Wall
# - To turn of SSL remove CCSECURE and LDSECURE

CC=g++
CCSECURE=-DCONNSECURE
INCCCFLAGS=-g -Wall -O2 -DUNIX -D$arch -DSTACKTRACEON -I..
CCFLAGS=\$(INCCCFLAGS) \$(CCSECURE)

LD=g++
LDSECURE=-lssl -lcrypto
LDFLAGS=\$(LDSECURE)

.SUFFIXES:\$(SUFFIXES) .cpp .cc .c

EOF

doSuffix cpp
doSuffix cc
doSuffix c
}

doMakefileDep()
{
test -d /usr/local/mysql
if [ $? = 0 ] ; then
	echo "DBINC=/usr/local/mysql/include"
	echo "DBLIB=/usr/local/mysql/lib"
else
	echo "DBINC=/usr/include/mysql"
	echo "DBLIB=/usr/lib/mysql"
fi
}

test -e Makefile
if [ $? != 0 ] ; then
	echo "Creating Makefile..."
	doMakefile > Makefile
fi

test -e Makefile.inc
if [ $? != 0 ] ; then
	echo "Creating include Makefile..."
	doMakefileInc > Makefile.inc
fi

test -e server
if [ $? = 0 ] ; then
	test -e server/Makefile.db
	if [ $? != 0 ] ; then
		echo "Creating database Makefile..."
		doMakefileDep > server/Makefile.db
	fi
fi

test -d bin
if [ $? != 0 ] ; then
	mkdir bin
fi

test -e server
if [ $? = 0 ] ; then
	test -e bin/uadata.edf
	if [ $? != 0 ] ; then
		echo "Creating initial data file..."
		
		touch bin/uadata.edf
		echo "<>" >> bin/uadata.edf
		echo "  <system>" >> bin/uadata.edf
		echo "    <database=\"ua\"/>" >> bin/uadata.edf
		echo "  </system>" >> bin/uadata.edf
		echo "</>" >> bin/uadata.edf
	fi
fi
