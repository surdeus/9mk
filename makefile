include makeconfig
TARG = ${PROGNAME}
OFILES = $(CFILES:.c=.o)
CFLAGS = ${DEFS} ${CPPFLAGS} ${INCS}
all: ${TARG}
strip: ${TARG}
	${STRIP} ${TARG}
%.o : %.c
	${CC} -c -o $@ ${CFLAGS} $<
clean:
	rm -f ${OFILES} ${TARG}
${TARG}: ${OFILES}
	${LD} -o ${TARG} ${LDFLAGS} ${OFILES} ${AFILES} ${LIBS}
install: ${TARG}
	mkdir -p ${EXEDIR} ${MANDIR}/1 ${APPDIR}/${PROGNAME}
	cp -f ${TARG} ${EXEDIR}/${TARG}
	chmod 0755 ${EXEDIR}/${TARG}
	cp -f man ${MANDIR}/1/${PROGNAME}
	chmod 0644 ${MANDIR}/1/${PROGNAME}
	cp -rf inc ${APPDIR}/${PROGNAME}
