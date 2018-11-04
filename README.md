# Chinstrap overlay
[![Helmet](chinstrap.png)](https://github.com/mgomersbach/chinstrap-overlay)
> Helmet not included



[![Repoman Status](https://travis-ci.com/mgomersbach/chinstrap-overlay.png?branch=master)](https://travis-ci.com/mgomersbach/chinstrap-overlay) Repoman

This overlay provides a Gentoo based install with too many unmasked versions.

It's a set of tools and settings (Saltstack) gathered over the years.

Binary hosts are set in profiles to ease installation and reduce compile times.

## Installation

Gentoo:

```sh
emerge git eselect-repository
```

```sh
eselect repository add chinstrap git https://github.com/mgomersbach/chinstrap-overlay.git
```


## Usage example

```sh
$ eselect profile list
Available profile symlink targets:
...
  [57]  chinstrap:chinstrap/default/linux/amd64 (stable)
  [58]  chinstrap:chinstrap/default/linux/amd64/buildhelper (stable)
  [59]  chinstrap:chinstrap/default/linux/amd64/server (stable)
  [60]  chinstrap:chinstrap/default/linux/amd64/desktop (stable)
  [61]  chinstrap:chinstrap/default/linux/amd64/markws (stable)
...
$ eselect profile set 57
$ source /etc/profile && env-update
$ emerge -uDNg @world
$ salt-call state.highstate
```


## Meta

Mark Gomersbach – markgomersbach@gmail.com

Distributed under the GPLv2 license. See ``LICENSE`` for more information.
