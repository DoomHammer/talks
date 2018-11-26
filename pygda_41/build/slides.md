title: Mój przyjaciel `make`
class: animation-fade
layout: true

---

class: impact

# {{title}}

---

class: impact

## Czyli dlaczego i jak zautomatyzować proces rozwoju oprogramowania?

---

# Piotr Gaczkowski

![DoomHammer](doomhammer.jpg)

[https://github.com/DoomHammer](https://github.com/DoomHammer)

[https://doomhammer.info](https://doomhammer.info)

---

class: impact

# Dlaczego automatyzować?

---

background-image: url(jetson.webp)
background-size: 80% 70%

---

class: impact

# Czym automatyzować?

---

# Czym automatyzować?

- Bower

--

- Yeoman

--

- Grunt

--

- Gulp

--

- NPM

--

- YARN

---

# Czym automatyzować?

- Setuptools

--

- Ansible

--

- Terraform

--

- `go build`

--

- [...]

---

background-image: url(tools.jpg)
background-size: 80% 70%

---

class: impact

# Dlaczego `make`?

---

background-image: url(llap.gif)
background-size: 80% 70%

---

class: impact

# Uniwersalny klej

---

# Uniwersalny klej

## Przykład: instalacja zależności z NPM

```make
node_modules: package.json
	npm install
```

---

# Uniwersalny klej

## Przykład: uruchamianie testów

```make
.PHONY: test

test: build
	npm test
	
build: node_modules
	npm build
	
node_modules: package.json
	npm install
```

---

class: impact

# Zestawianie środowiska rozwojowego

---

# Zestawianie środowiska rozwojowego

## Konwencje

- `make prepare`

--

- `make dev`

--

- `make deploy`

--

- `make infrastructure`

--

- `make all`

---

background-image: url(code_monkey.jpg)
background-size: 80% 70%

---

class: impact

# Przykłady

---

# Przykład: instalacja uchwytów Git

```make
.PHONY: dev

.stamps:
	@mkdir -p $@

.stamps/git-hooks.installed: | .stamps
	# This checks whether git-hooks is an executable and installs it with
	# Homebrew/Linuxbrew is possible.
	@if ! command -v git-hooks >/dev/null 2>&1; then \
	  if command -v brew >/dev/null 2>&1; then \
	    brew install git-hooks; \
	  else \
	    echo "You have to install https://github.com/icefox/git-hooks"; \
	    exit 1; \
	  fi; \
	fi
	@touch $@
```

---

# Przykład: instalacja uchwytów Git

```make
.git/hooks.old: | .stamps/git-hooks.installed
	git hooks --install

dev: | .git/hooks.old
	pip install -e .[dev]
```

---

# Przykład: budowanie kontenera

```make
WEBAPP_SOURCES = $(sort $(notdir $(wildcard webapp/**/*)))

all: webapp

.stamps: Makefile
	@mkdir -p $@

third-party/top_secret.xml:
	# WEB_USER and WEB_AUTH_TOKEN are variables that should contain
	# credentials required to obtain the file.
	@curl -u "$(WEB_USER):$(WEB_AUTH_TOKEN)" \
	  https://example.com/downloads/this_is_a_secret.xml -L -o $@

webapp: .stamps/webapp.stamp
WEBAPP_DEPS = webapp/Dockerfile third-party/top_secret.xml
WEBAPP_DEPS += $(WEBAPP_SOURCES)
.stamps/webapp.stamp: .stamps $(WEBAPP_DEPS)
	docker build -t example/webapp -f webapp/Dockerfile webapp
	@touch $@
```

---

class: impact

# Szaleństwo?

# To jest DevOps!

---

background-image: url(leonidas.jpg)
background-size: 80% 70%

---

# Przykład: wdrożenie

```make
# We include the previous Makefile so we can build the image
include previous.mk

.stamps/webapp_pushed.stamp: .stamps/webapp.stamp
        docker push example/webapp
        @touch $@

infrastructure: $(INFRASTRUCTURE_SOURCES)
        cd deployment/terraform && terraform apply

deploy: all infrastructure
        cd deployment && ansible-playbook -i inventories/hosts deploy.yml

.PHONY: infrastructure deploy
```

---

class: impact

# A co z CI/CD?

---

# A co z CI/CD?

`travis.yml`

```yaml
before_install:
  - make prepare

install:
  - make all

script:
  - make test

after_success:
  - make deploy
```

---

### Want to know the easiest way to save time? Use `make`!

https://medium.freecodecamp.org

---

class: impact

# Dziękuję!

![DoomHammer](doomhammer.jpg)

### [https://github.com/DoomHammer](https://github.com/DoomHammer)

### [https://doomhammer.info](https://doomhammer.info)
