registry := dockerregistry.westermo.com:443

imgs := $(foreach df,$(wildcard */Dockerfile),$(subst /,,$(dir $(df))))

all: $(imgs)

$(imgs):
	docker build -t $(registry)/$@ $@

.PHONY: all $(imgs)
