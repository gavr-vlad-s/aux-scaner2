LINKER        = g++
LINKERFLAGS   =  -s
COMPILER      = g++
COMPILERFLAGS =  -std=c++14 -Wall
BIN           = aux-scaner-test
LIBS          = -lboost_filesystem -lboost_system
vpath %.cpp src
vpath %.o build
OBJ           = aux-scaner-test.o get_processed_text.o print_char32.o error_count.o aux_expr_scaner.o char_conv.o file_contents.o char_trie.o fsize.o
LINKOBJ       = build/aux-scaner-test.o build/get_processed_text.o build/print_char32.o build/error_count.o build/aux_expr_scaner.o build/char_conv.o build/file_contents.o build/char_trie.o build/fsize.o

.PHONY: all all-before all-after clean clean-custom

all: all-before $(BIN) all-after

clean: clean-custom 
	rm -f ./build/*.o
	rm -f ./build/$(BIN)

.cpp.o:
	$(COMPILER) -c $< -o $@ $(COMPILERFLAGS) 
	mv $@ ./build

$(BIN):$(OBJ)
	$(LINKER) -o $(BIN) $(LINKOBJ) $(LIBS) $(LINKERFLAGS)
	mv $(BIN) ./build