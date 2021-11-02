title: Building and Packaging Modern C++
class: wrapper <!-- , animation-fade -->
layout: true

---

class: wrapper, center, middle

# {{title}}

---

class: wrapper, center, middle

# Piotr Gaczkowski

![DoomHammer](img/doomhammer.jpg)

<https://github.com/DoomHammer> | <svg aria-hidden="true" focusable="false"
data-prefix="fab" data-icon="twitter" class="svg-inline--fa fa-twitter fa-w-16"
role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="1em"><path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg> [@doomhammerng](https://twitter.com/doomhammerng)

<https://doomhammer.info>

---

class: wrapper, center, middle

# Adrian Ostrowski

<img src="img/ao.jpg" style="width: 200px; height: 200px"/>

<https://github.com/aostrowski> | <svg aria-hidden="true" focusable="false"
data-prefix="fab" data-icon="twitter" class="svg-inline--fa fa-twitter fa-w-16"
role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="1em"><path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg>[@adr_ostrowski](https://twitter.com/adr_ostrowski)

<img src="img/logos/habana_classic_blue.png" style="width: 200px; border-radius: 0px"/>

---

background-image: url(img/samuel-regan-asante-g9A2llpDObU-unsplash.jpg)

---

class: wrapper, center, middle

# Speeding up Builds

---

class: wrapper, center, middle

# CCache

https://ccache.dev/

???
In essence: compiler cache

---

# CCache - features

- much faster recompilation 
???
- supports C, C++, Objective-C, Objective-C++, CUDA & assembly
--

- compression
--

- statistics
???
- low overhead
- checksums for correctness since 4.0
--

- silent fallback in unsupported cases
--

- easy integration
--

- support for C++20's modules
???
- modules - doc mentions Clang only; require settings a few options

---

# CCache - supported environment

- works on Linux and macOS, other Unixes, and Windows
- supports GCC, Clang and NVCC
- MSVC support underway (PR [#506](https://github.com/ccache/ccache/pull/506))

---

exclude: true

# CCache - usage

```
ccache [flag]
ccache [[compiler] [flags ...]]
compiler [flags ...]
```
???
First: for managing ccache itself, e.g. stats
2 & 3: for compiling
--

exclude: true

or via build systems

---

# CCache - installation

- Windows:
  - just use binaries from GitHub
- Others:
  - system package manager - usually not the latest version
  - `brew install ccache`
  - build from sources (CMake)

---

class: wrapper, center, middle

# Intermission: Brew

![Homebrew](img/homebrew-256x256.png) <!-- TODO: can we use this image legally-speaking? -->

https://brew.sh/

???
Package manager for macOS and Linux

Why use it?
- all files installed in one subtree - clean removal if needed
- plethora of packages in recent versions
  - Snap has old and unofficial CCache (3.7 vs brew's 4.2)

Scoop for Windows

Python has C++ software too, e. g. CMake (`pip install cmake`)

---

# CCache - usage

- invoke manually
```
ccache <compiler> <compiler_args>
```
--

- invoke via symbolic links masquerading the compilers
???
masqerading: we'll show that in a sec
--

- integrate with build systems

---

# CCache - masquerading compilers

To ensure CCache is used by default:
--

1. Run:
```
cp ccache /usr/local/bin/
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
ln -s ccache /usr/local/bin/cc
ln -s ccache /usr/local/bin/c++
```
???
When invoked, ccache deduces orig. compiler from $0
--

2. Put `/usr/local/bin` early in `PATH`

---

# CCache - configuration

- many environment variables 
- corresponding settings in `ccache.conf`
???
In most cases defaults work well.

---

# CCache - configuration, cont'd

- cache size and location
- behavior: `sloppiness`, preprocessing, etc.
- compiler specific, e. g. `prefix_command`
- read only mode
- debugging and logging

???
Cache size - one thing worth increasing.

Sloppiness:
- pretty strict by default -> less false hits
- allows to use ctimes/mtimes instead of file contents
- needed for modules and precompiled headers

---

# CCache - integrating with CMake

Available since CMake 3.4
--

```
-DCMAKE_CXX_COMPILER_LAUNCHER=ccache
```
--

```
find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()
```

???
RULE_LAUNCH_LINK - no use, CCache doesn't support linking

---

# CCache - sharing cache

- possible on same machine and using a network storage
--

- for locations afar, consider providing their own caches
--

- users need to be in same group
--

- in config, provide:

```
cache_size = 100G
base_dir = /home/current/user/
cache_dir = /network/storage/path
hash_dir = false
temporary_dir = /some/local/dir/like/tmp
umask = 002
```

???

- `base_dir` - allows different users to share cache
- `hash_dir` - paths in debug symbols
- `temporary_dir` - faster + helps avoid some bugs
- To share between OS-es: set `sloppiness` to `system_headers`

---

# How much does it help?

A lot!

Personal experience: builds shorter by up to 95%

---

# How much does it help - cont'd

![Benchmark](img/ccache.png)

???

- Preprocessor - first run preprocessor, then hash results
- Direct - hash source file and include files directly. If miss, goto preprocessor.
- Depend - like direct, but doesn't goto preproc. on miss. 
  - depends on compiler's `-MD` or `-MMD`
  - Great for dist. builds (reduce local overhead)

---

class: wrapper, center, middle

# What else a developer needs?

---

background-image: url(img/lama-roscu-Wpg3Qm0zaGk-unsplash.jpg)

---

class: wrapper, center, middle

# Icecream

https://github.com/icecc/icecream

???
fork of distcc - with a central server that chooses fastest free server

---

# Icecream - features

- scheduler 
--

  - only uses free resources on machines
--

  - allows good perf on heterogeneous environments
--

  - allows some machines to be off during compilation
--

- remote cross compiling
???
Automatically sends toolchain to remote
--

- monitoring

---

exclude: true

# Monitoring - Icemon

https://github.com/icecc/icemon

---

# Monitoring - Sundae

https://github.com/JPEWdev/icecream-sundae

<img style="position:absolute;bottom: 10px;right: 0px;object-fit: scale-down;width: 60%;" src="img/sundae.png" />

---

# Monitoring - Sundae - cont'd

![Sundae](img/icecream_sundae_demo.png)

???

% - local job
= - remote job

---

# Icecream - supported environments

- Linux
- macOS
- FreeBSD
- Cygwin

No native Windows :(

---

background-image: url(img/icecream.jpg)

---

# Icecream - installation

- developers recommend using distro's package
  - `sudo apt install icecc`
  - `sudo apt install icecc-scheduler`
  - `sudo apt install icecream-sundae`

???
- `icecc` has client and daemon (both required for remote builds)
- scheduler - on one host only (two possible, automatic fallback)
- sundae - optional
---

# Icecream - configuration

- firewall
  - TCP: 10245, 8765, 8766
  - UDP: 8765
- other defaults should work fine
- persistent connections:
  - `--scheduler-host` for daemon
  - `--persistent-client-connection` for scheduler
???

icecc must be in your path - that's all.
Network should be fast. Avoid far away nodes.
Scheduler should have dedicated resources - sensitive to latency.

---

# Icecream - configuration, cont'd

To ensure Icecream is always used by default, put

```
/usr/lib/icecc/bin
```

early in your `PATH`.

---

# Icecream - integrating with CMake

```
find_program(ICECC_PROGRAM icecc)
if(ICECC_PROGRAM)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${ICECC_PROGRAM}")
endif()
```

---

# Combining CCache and Icecream

- Your `ccache.conf` file must contain:
```
prefix_command=icecc
```
--

- CCache should come before IceCC in `PATH`

---

# How much does it help?

![Firefox with IceCC](img/icecc_firefox.png)

???
- Many cases show at least 20% faster builds
- More responsive local machine

https://bugzilla.mozilla.org/show_bug.cgi?id=927952

---

class: wrapper, center, middle

# Noteworthy alternatives

---

# IncrediBuild

- distributed building for Windows and Linux
- commercial

https://www.incredibuild.com/

---

# `sccache`

- Mozilla's `ccache`-like compiler cache
- built-in `icecream`-style distributed compilation
- supports C, C++, Rust, and NVCC
- on Windows, Linux and macOS

Not production ready yet (current version: 0.2.15)

https://github.com/mozilla/sccache

---

exclude: true

# Bazel

https://bazel.build/

---

exclude: true

# C++20's Modules

TODO

---

background-image: url(img/switch.jpg)

---

class: twitter
# Portable build environments

--

How to make sure everyone's playing the same toys?

---

class: twitter
# VMs

--

- All the software preinstalled

--

- Easy distribution

--

- May be less than pleasant to use

---

class: twitter
# Containers?

--

- Oooh, shiny!

--

- Slicker than VMs!

--

- Application containers and toolchains don't match

---

class: twitter
# What else?

---

class: twitter
# Nix features

- Operates in userland

- Deterministic packages and environments

- Atomic upgrades

- Rollbacks

- Build environment management

- Multiple versions of packages side-by-side on a single system

- Runs on Linux and macOS

---

class: twitter
# Functional approach

- Installing or upgrading package won't break other packages

- Every package is installed in a separate directory

- It allows easy rollback

- Prevents inconsistent state

---

class: twitter
# Good for multi-user environments

- Several users can install packages without superuser privileges

- Different users can have different package versions

---

class: twitter
# Projects with direnv

Uses `nix-shell`.

Automatically sets up development environment whenever you enter a directory.

You can pin the packages version.

---

.envrc

```bash
use_nix
. env/bin/activate
```

default.nix

```nix
{ pkgs ? import <nixpkgs> {} }:

with pkgs; {
  gcc11Env = stdenvNoCC.mkDerivation {
    name = "gcc11-environment";
    buildInputs = [ cmake ccache gcc11 git gnumake icecream ];
  };
}
```

---

class: twitter
# How Does it Compare to The Rest?

- Still not as easy as Homebrew

- Getting a working GCC compiler from Git is still tricky

- GNU Guix using GNU Scheme (LISP)

- ... if you love parentheses, you'll love GUIX!

- ... also works with direnv!

---

class: twitter

# Managing Git hooks

--

- There's an app for that!

--

- pre-commit

---

class: twitter

# pre-commit

```
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.5.0
    hooks:
      - id: check-added-large-files
      - id: check-byte-order-marker
      - id: check-case-conflict
      - id: check-merge-conflict
      - id: mixed-line-ending
      - id: no-commit-to-branch
        args: [--branch, master]
      - id: trailing-whitespace
```

---

class: twitter

# pre-commit

```
#[...]
  - repo: https://github.com/pocc/pre-commit-hooks
    rev: v1.1.0
    hooks:
      - id: clang-format
        args: [--style=Google, -i]
        exclude: 3rd-parties/
  - repo: https://github.com/iconmaster5326/cmake-format-pre-commit-hook
    rev: v0.6.9
    hooks:
      - id: cmake-format
        exclude: 3rd-parties/
```

---

class: twitter

# Packaging

---

class: twitter

# Conan

--

- Package manager for C++

--

- Written in Python

--

- like pip/npm/gem but with full toolchain support

--

- uses binaries when possible

---

class: twitter

# Conan - downsides

--

- Binaries might be missing for your platform

--

- Sometimes resorts to system packages in a weird way

--

- Still in fast-paced development, things may not be entirely stable

--

- Creating your own packages requires some skill

---

class: twitter

# Conan profile

```
[settings]
os=Linux
os_build=Linux
arch=x86_64
arch_build=x86_64
compiler=gcc
compiler.version=11
compiler.libcxx=libstdc++11
build_type=Release
[options]
[build_requires]
[env]
```

---

class: twitter

# Conanfile

```
[requires]
flac/1.3.3
spdlog/[>=1.4.1]

[generators]
cmake
```

---

class: twitter

# CMakeLists.txt

```
#[...]
conan_basic_setup(TARGETS)
#[...]
target_link_libraries(
  songcorder
  #[...]
  ${CONAN_LIBS}
  #[...]
)
```

---

class: twitter

# Conanfile

```
[requires]
ms-gsl/3.1.0

[generators]
CMakeDeps
```

---

class: twitter

# CMakeLists.txt

```
find_package(ms-gsl CONFIG REQUIRED)
```

---

class: twitter

# CPack

--

- Generates sources and binary packages

--

- Could spit out NSIS installers and macOS dmg archives

--

- Produces Deb and RPM on supported platforms

---

class: twitter

# AppImage / Flatpack

- The new way to package portable Linux apps

---

<img src="img/prettyplease.jpg" style="width: auto; height: 600px"/>

---

class: center, middle, split50

# Hungry for more?

.left-pane[
  <img src="img/book_cover.jpg" style="width: auto; height: 400px"/>
]
.right-pane[
.left[
Check out the book

Featuring:
- More on architectural styles
- Designing quality software
]
]

---

# Questions?

---

class: center, middle, split50

# Thank you!

.left-pane[
  ![DoomHammer](img/doomhammer.jpg)

  <https://github.com/DoomHammer>

  <https://doomhammer.info>
]
.right-pane[
  <img src="img/ao.jpg" style="width: 200px; height: 200px"/>

  <https://github.com/aostrowski>

  <img src="img/logos/habana_classic_blue.png" style="height: 30px; margin-top: -10px; border-radius: 0px"/>
]

### <https://doomhammer.info/talks/meetingcpp2021>

---

# Attributions

- _Building Site_ photo by <a href="https://unsplash.com/@fkaregan?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Samuel Regan-Asante</a> on <a href="https://unsplash.com/?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a>

- _Icecream rainbow_ photo by <a href="https://unsplash.com/@lamaroscu?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Lama Roscu</a> on <a href="https://unsplash.com/s/photos/icecream?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a>

- Sundae image by <a href="https://pixabay.com/users/blende12-201217/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=2300531">Gerhard G.</a> from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=2300531">Pixabay</a>

- Switch photo by <a href="https://unsplash.com/@twinsfisch?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Isabella and Louisa Fischer</a> on <a href="https://unsplash.com/s/photos/switch?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>
