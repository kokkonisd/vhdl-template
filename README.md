# vhdl-template

A Makefile-based template for open-source VHDL projects, using [GHDL](http://ghdl.free.fr/) and
[GTKWave](http://gtkwave.sourceforge.net/).


## How to install

### Linux

Some dependencies need to be installed for GHDL:

```text
$ sudo apt update
$ sudo apt install -y git make gnat zlib1g-dev
```

Then, GHDL needs to be built from source:

```text
$ git clone https://github.com/ghdl/ghdl
$ cd ghdl/
$ ./configure --prefix=/usr/local
$ make
$ sudo make install
```

It should now be installed; you can test with:

```text
$ ghdl -v
```

GTKWave should be installable via `apt`:

```text
$ sudo apt install -y gtkwave
```


### macOS

This installation is simpler using [Homebrew](https://brew.sh/).

First, GNAT is needed, which can be downloaded from [here](https://www.adacore.com/download).

Once the GNAT toolchain is installed, it must be put into the `PATH`, by adding the following line to your
`.bashrc`/`.zshrc`:

```bash
# Note: this is the current install path of GNAT, check the installation program in the previous step if you're not
# sure exactly where the GNAT toolchain was installed
export PATH=$HOME/opt/GNAT/2020/bin:$PATH
```

GHDL needs to be built from source:

```text
$ git clone https://github.com/ghdl/ghdl
$ cd ghdl/
$ ./configure --prefix=/usr/local
$ make
$ sudo make install
```

It should now be installed; you can test with:

```text
$ ghdl -v
```

GTKWave should be installable via Homebrew:

```text
$ brew install gtkwave
```


## How to use

I've written a [short blogpost](https://kokkonisd.github.io/2020/11/18/vhdl-project-template/) on how to use this
template, with a concrete example project.
