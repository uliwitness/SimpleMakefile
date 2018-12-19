IDIR=.
SDIR=.
ODIR=build/obj
BINDIR=build
CC=clang++
CFLAGS=-I$(IDIR)
LIBS=-lm

_DEPS = hellofunc.h
_OBJ = hellomake.o hellofunc.o 

$(shell mkdir -p $(IDIR) $(SDIR) $(BINDIR) $(ODIR))

DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $(BINDIR)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
