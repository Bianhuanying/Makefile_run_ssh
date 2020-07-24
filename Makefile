
source = $(wildcard *.cpp)
object = $(patsubst %.cpp, %.o, $(source))

CXX = g++-4.8
CXXFLAGS = -O3 -g -std=c++0x -fPIC -D__SERIALIZATION__ -DMULTITHREAD -pthread -I/opt/local/include 
LIBS = -lbase -llac -llapack -ltbb  -lm -lmpi -lmpi_cxx -pthread 
LDFLAGS = -L/opt/local/lib -lAFEPack

all : main

%.o : %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

main : $(object)
	$(CXX) -o $@ $(object) $(LDFLAGS) $(LIBS)

clean :
	-rm -rf $(object)
	-rm -rf main
	-rm -f *.[nes]
	-rm -f *.dx

.PHONY : default clean
