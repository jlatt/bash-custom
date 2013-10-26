CONFDIR := config
targets := $(patsubst %, $(HOME)/.%, $(notdir $(wildcard $(CONFDIR)/*)))

$(HOME)/.%: $(CONFDIR)/%
	@cp -v $< $@

all: $(targets)
