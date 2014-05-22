TARGETS         = TestSim
SRCS            = classify.cc execute.cc main.cc armsim.cc parse.cc
HEADERS         = armsim.hpp
CC              = x86_64-pc-cygwin-g++
OBJS            = $(SRCS:.cc=.o)
srcdir          = .
INCLUDES	= -I$(srcdir)
# CXXFLAGS          = -g
CXXFLAGS        = -O3
LDFLAGS		= 
LIBS		= -lstdc++
DEBUG_OPTIONS = DEBUG_NAMES

LIBDIR = ~/cpe462/Source/libs/

# DEPEND		= makedepend
# DEPEND_FLAGS	= 
# DEPEND_DEFINES	= 


default: $(TARGETS)

all: 

$(TARGETS): $(OBJS) $(HEADERS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:  
	-rm -f *.o *.a $(TARGETS)
   
test:
	$(CC) -Wall -c $(LIBDIR)*.cpp 
	ar rvs libs.a *.o
	rm *.o
	$(CC) -Wall -o TestSim test.cpp libs.a -I $(LIBDIR) -D $(DEBUG_OPTIONS)

# depend:
# 	$(DEPEND) -s '# DO NOT DELETE: updated by make depend'		   \
# 	$(DEPEND_FLAGS) -- $(INCLUDES) $(DEFS) $(DEPEND_DEFINES) $(CFLAGS) \
# 	-- $(SRCS)
