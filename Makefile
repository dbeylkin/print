LIB       = libprint
FC        = gfortran
FFLAGS    = -O3

ARCH      = ar
ARCHFLAGS = cr
RANLIB    = ranlib

SRC       = src
EXAMPLE   = example

vpath %.f90 $(SRC)

OBJ       = print.o
EXEC      = int2

.PHONY: all driver

all: $(LIB).a

$(LIB).a: $(OBJ)
	$(ARCH) $(ARCHFLAGS) $@ $(OBJ)
	$(RANLIB) $@

driver: $(LIB).a
	$(FC) $(FFLAGS) -L. -o $(EXEC) $(EXAMPLE)/print_driver.f90 -lprint

clean:
	rm -f *.o

cleanlib:
	rm -f *.mod
	rm -f $(LIB).a

cleandriver:
	rm -f $(EXEC)

cleanall: clean cleanlib cleandriver

%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

help:
	@echo "Please use \"make <target>\" where <target> is one of"
	@echo "  all         to make $(LIB).a library"
	@echo "  driver      to make the example driver program"
	@echo "  clean       to remove all compiled objects"
	@echo "  cleanlib    to remove all libraries"
	@echo "  cleandriver to remove example driver program"
	@echo "  cleanall    to clean everything"
	@echo "  help        to display this help message"
