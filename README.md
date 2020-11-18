# vhdl-template

A Makefile-based template for open-source VHDL projects, using [GHDL](http://ghdl.free.fr/) and
[GTKWave](http://gtkwave.sourceforge.net/).


# How to install

## Linux

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


## macOS

This installation is simpler using [Homebrew](https://brew.sh/).

Some dependencies need to be installed for GHDL:

```text
$ brew install git make gnat zlib1g-dev
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
$ brew install gtkwave
```


# How to use

TODO
