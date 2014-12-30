CC = gcc 
CFLAGS = -O -Wall

enable_openmp=no
ifeq ($(enable_openmp), yes)
LDFLAGS += -fopenmp
CFLAGS += -fopenmp -DENABLE_OPENMP
endif
enable_symmetric=no
ifeq ($(enable_symmetric), yes)
CFLAGS += -DSYMMETRIC
endif

OBJS = direct.o cpu.o ./libpg5.a

direct: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -lm
direct.o: direct.c
	$(CC) $(CFLAGS) -c direct.c
cpu.o: cpu.c
	$(CC) $(CFLAGS) -c cpu.c
#libpg5/libpg5.a: libpg5/libpg5.a
#	make -C libpg5 enable_openmp=$(enable_openmp) libpg5.a

clean:
	rm -rf *.o
	make -C libpg5 clean
distclean: clean
	rm -rf direct *~
	make -C libpg5 distclean
