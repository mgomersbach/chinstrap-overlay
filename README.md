# Chinstrap overlay
[![Helmet](chinstrap.png)](https://github.com/mgomersbach/chinstrap-overlay)
> Helmet not included

[![Repoman Status](https://travis-ci.com/mgomersbach/chinstrap-overlay.png?branch=master)](https://travis-ci.com/mgomersbach/chinstrap-overlay)
[![Join the chat at https://gitter.im/chinstrap-overlay/Lobby](https://badges.gitter.im/chinstrap-overlay/Lobby.png)](https://gitter.im/chinstrap-overlay/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Chat on freenode](https://img.shields.io/badge/chat-on%20freenode-red.png)](irc://freenode/chinstrap)


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
[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/0)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/0)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/1)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/1)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/2)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/2)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/3)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/3)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/4)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/4)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/5)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/5)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/6)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/6)[![](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/images/7)](https://sourcerer.io/fame/mgomersbach/mgomersbach/chinstrap-overlay/links/7)


Mark Gomersbach – markgomersbach@gmail.com

Distributed under the GPLv2 license. See ``LICENSE`` for more information.


