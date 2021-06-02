PWD := $(shell pwd)
OS_TYPE		:= $(shell echo `uname`)
MACHINE_TYPE	:= $(shell echo `uname -m`)
ifeq (${MACHINE_TYPE}, x86_64)
	MACHINE_TYPE = amd64
endif
BUILD_DIR	:= ${PWD}/${OS_TYPE}-${MACHINE_TYPE}/bin

export CXX = g++ -std=c++11

all: extractSequences mecatCanu mecat

extractSequences: 
	cd extract_sequences && make

mecatCanu:
	cd mecat2canu/src && chmod 777 canu_version_update.pl && make

mecat:
	cd src && make

.PHONY: clean
clean:
	cd extract_sequences && make clean
	cd mecat2canu/src && make clean
	cd src && make clean
	
