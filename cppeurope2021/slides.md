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

<https://github.com/DoomHammer> | [@doomhammerng](https://twitter.com/doomhammerng)

<https://doomhammer.info>

---

class: wrapper, center, middle

# Adrian Ostrowski

<img src="img/ao.jpg" style="width: 200px; height: 200px"/>

<https://github.com/aostrowski> | [@adr_ostrowski](https://twitter.com/adr_ostrowski)

<img src="img/logos/habana_classic_blue.png" style="width: 200px; border-radius: 0px"/>

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
- compression
- statistics
- silent fallback in unsupported cases
- easy integration with CI
- support for C++20's modules (doc mentions Clang only; require settings a few options)

???
- supports C, C++, Objective-C, Objective-C++, CUDA & assembly
- low overhead
- checksums for correctness since 4.0

---

# CCache - supported environment

- works on Linux and macOS, other Unixes, and Windows
- supports GCC, Clang and NVCC
- MSVC support underway ([#506](https://github.com/ccache/ccache/pull/506))

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

or via build systems

---

# CCache - installation

- Windows: just use binaries from GitHub
- Others:
  - system package manager - usually not the latest version
  - `brew install ccache`
  - build from sources (CMake)

---

# Intermission: Brew

![Homebrew](img/homebrew-256x256.png) <!-- TODO: can we use this image legally-speaking? -->

https://brew.sh/

???
Package manager for macOS and Linux

Why use it?
- all files installed in one subtree - clean removal if needed
- plethora of packages in recent versions
  - Snap has old and unofficial CCache (3.7 vs brew's 4.2)

---

# CCache - configuration

Ensuring CCache is always used:

1. Run:

```
cp ccache /usr/local/bin/
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
ln -s ccache /usr/local/bin/cc
ln -s ccache /usr/local/bin/c++
```

2. Put `/usr/local/bin` early in `PATH`

---

# CCache - configuration, cont'd

Many environemnt variables and corresponding settings in `ccache.conf`.

- cache size and location
- behavior: `sloppiness`, preprocessing, etc.
- compiler specific, e. g. `prefix_command`
- read only mode
- debugging and logging

???
In most cases defaults work well.
Cache size - one thing worth increasing.

Sloppiness:
- pretty strict by default -> less false hits
- use ctimes/mtimes instead of file contents
- needed for modules and precompiled headers

---

# CCache - integrating with CMake

- since CMake 3.4
- 
```
-DCMAKE_CXX_COMPILER_LAUNCHER=ccache
```
- 
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
- users need to be in same group
- for locations afar, consider providing their own caches
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

`base_dir` - allows different users to share cache
`hash_dir` - paths in debug symbols
`temporary_dir` - faster + helps avoid some bugs
To share between OS-es: set `sloppiness` to `system_headers`

---

# How much does it help?

A lot!

Personal experience: 12 minutes &rarr; less than 30 seconds

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

# Icecream

https://github.com/icecc/icecream

???
fork of distcc - with a central server that chooses fastest free server

---

# Icecream - features

- scheduler 
  - only uses free resources on machines
  - allows good perf on heterogeneous environments
  - allows some machines to be off during compilation
- remote cross compiling
- monitoring

---

# Monitoring - Icemon

TODO

---

# Monitoring - Sundae

![Sundae](img/sundae.gif)

---

# Icecream - supported environment

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
- ready-made docker containers are convenient too:
  - cbarraco/icecc-scheduler
  - cbarraco/icecc-daemon

???
take a look at Dockerfiles
adapt if newer IceCC is needed

---

# Icecream - configuration

- persistent connections:
  - `--scheduler-host` for daemon
  - `--persistent-client-connection` for scheduler
- firewall
  - TCP: 10245, 8765, 8766
  - UDP: 8765

???

Defaults work fine.
icecc must be in your path - that's all.
Network should be fast. Avoid far away nodes.
Scheduler should have dedicated resources - sensitive to latency.

---

# Icecream - configuration, cont'd

To ensure Icecream is always used by default, put

```
/usr/lib/icecc/bin
```

early in your path.

---

# Combining CCache and Icecream

Your `ccache.conf` file must contain:

```
prefix_command=icecc
```

CCache should come before IceCC in `PATH`

---

# How much does it help?

- builds faster by ~ 20%
- more responsive local machine

![Firefox with IceCC](img/firefox_icecc.png)

---

class: wrapper, center, middle

# Noteworthy alternatives

---

# IncrediBuild

- distributed building for Windows and Linux
- commercial

https://www.incredibuild.com/

---

# sccache

- Mozilla's `ccache`-like compiler cache
- built-in `icecream`-style distributed compilation
- supports C, C++, Rust, and NVCC
- supports Windows, Linux and macOS

- not production ready yet (current version: 0.2.15)

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

### <https://doomhammer.info/talks/cppeurope2021>
