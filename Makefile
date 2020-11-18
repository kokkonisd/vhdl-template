# Flag to indicate wether we are in debug mode or not
DEBUG ?= 1
# Default max simulation time
SIMTIME ?= 100ns

# VHDL compiler
GHDL = ghdl
# Wave simulator
ifeq ($(shell uname -s), Linux)
	WAVE = gtkwave
else
	# macOS support for gtkwave
	WAVE = open -a gtkwave
endif

# Source code directory
SRC = src
# Test bench directory
TB = tb
# Simulation file directory
SIMU = simu

# Set error exit code according to the DEBUG flag
# Set maximum tolerance assertion level (errors will be triggered for this error type & above)
ifeq ($(DEBUG), 1)
	ERROREXIT = 0
	ASSERTLVL = error
else
	ERROREXIT = 1
	ASSERTLVL = warning
endif

# Source VHDL files
SOURCES = $(wildcard $(SRC)/*.vhdl)
TARGETS = $(patsubst $(SRC)/%.vhdl, %, $(SOURCES))
# Simulation files
SIMULATIONS = $(wildcard $(SIMU)/*.vcd)


all: $(TARGETS)


# IP with test bench
%: $(SRC)/%.vhdl $(TB)/%_tb.vhdl
	@echo "\033[0;33m[Compiling \`$@.vhdl\` & \`$@_tb.vhdl\` ...]\033[0m"
	$(GHDL) -s $(SRC)/$@.vhdl $(TB)/$@_tb.vhdl
	$(GHDL) -a $(SRC)/$@.vhdl $(TB)/$@_tb.vhdl
	$(GHDL) -e $@_tb

	@echo "\033[0;33m[Running simulation of \`$@_tb\` ...]\033[0m"
	@$(GHDL) -r $@_tb --vcd=$(SIMU)/$@.vcd --assert-level=$(ASSERTLVL) --stop-time=$(SIMTIME) && \
		echo "\033[0;32m[\`$@\` PASS]\033[0m" || (echo "\033[0;31m[\`$@\` FAIL]\033[0m"; exit $(ERROREXIT))


# IP without test bench
%: $(SRC)/%.vhdl
	@echo "\033[0;33m[Compiling \`$@.vhdl\` ...]\033[0m"
	$(GHDL) -s $(SRC)/$@.vhdl
	$(GHDL) -a $(SRC)/$@.vhdl


simu:
	$(WAVE) $(SIMULATIONS)


clean:
	$(GHDL) --remove
	rm -rf $(SIMU)/*.vcd


.PHONY: all simu clean
