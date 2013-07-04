PROG=test
SRCS=$(PROG).cpp
OBJS=$(SRCS:.cpp=.o)

test: test.o
	$(CC) $(CXXFLAGS) $(LDFLAGS) -o $@ test.o

.cpp.o:
	$(CC) $(CPPFLAGS) $(CXXFLAGS) -c $<

check: $(PROG)
	env | sort
	./$(PROG)

clean:
	$(RM) $(OBJS) $(PROG)
