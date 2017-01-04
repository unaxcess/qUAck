# qUAck - Telnet look and feel client for UNaXcess II

## FAQ

### It doesn't compile

Probably the carriage return / line feed thing. Try this:

```
perl -pli~ -e 's/^V^M//' Makefile* */Makefile useful/useful.h useful/useful.cpp qUAck/CmdIO.cpp qUAck/qUAck.h EDF/EDF.cpp EDF/EDFElement.[ch]* Conn/Conn.cpp
```

Also check that you have installed all the dependencies (see list below).

### How do I configure it?

Under Unix you can put configuration options in a .qUAckrc file in your home directory. Under Windows put them in a qUAck.edf file in the same directory as the executable. Here's an example:

```
<>
 <server="localhost"/>
 <port=4040/>
 <username="sysop"/>
</>
```

Other settings:

```
<password="password"/>
```

If you don't specify a password in the config file you will be prompted for one

```
<secure=1/>
<certificate="qUAck.pem"/>
```

The certificate field is optional for secure connections

```
<editor="/bin/vi"/>
```

Use an external editor for text composition

```
<browse=1/>
<browser="/usr/bin/netscape"/>
<browserwait=1/>
```

Specify a browser for viewing URLs. browserwait tells qUAck to wait for the launched browser to finish before carrying on (useful for terminal stuff like lynx)

```
<attachmentsize=n/>
<attachmentdir="/tmp"/>
```

This sets the size of attachment you are prepared to recieved in a page.
By default no attachments will be sent to you. Use a setting of -1 for
any size. You can also specify a directory for saving attachments

```
<busy=1/>
<silent=1/>
<shadow=1/>
```

Login with busy / silent / shadow flag on (the ability to send and
recieve pages is diabled with shadow on)

```
<thinpipe=1/>
```

Use reduced data requests which refresh cached data (user list, folder
list) in case you're on a slow link

```
<screensize=1/>
```

Obey screen width / height settings stored on the server and ignore the
queried ones qUAck gets from your terminal

```
<usepid=1/>
```

Append the PID to the filename qUAck puts debug information into

### Backspace / delete / etc doesn't work in the editor (Unix)

Your version of curses is broken :-)

## Dependencies

The following dependencies are required for compilation:

 * OpenSSL headers - `libssl-dev` in Debian.
 * ncurses headers - `libncurses5-dev` in Debian.

## Credits

qUAck looks the way it does as a result of 10 years UI "refinement" beginning with old UNaXcess (circa 1984) and continuing until 1999 when we [the Manc CS UA bods] were dragged kicking and screaming onto UNaXcess II

Old UA guilty parties: Brandon S Allbery, Andrew G Minter, Phaedrus, Gryn, Techno, Laughter, Fran, BW

Special mention to Khendon and isoma - my favourite beta testers ever - who put up with bugs, compilation problems and a host of other obstacles to help me fix things before public release, Phaedrus for providing patches and using the exact opposite of all my settings and forcing me to fix all the code I never see or use, David for his first time user suggestions.

Enjoy!
