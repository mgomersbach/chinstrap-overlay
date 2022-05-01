# Changelog

## [1.1.42](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.41...1.1.42) (2022-05-01)


### Bug Fixes

* **qemu:** add gnutls useflag for vnc ([ae1fd14](https://github.com/mgomersbach/chinstrap-overlay/commit/ae1fd141f19c563ef77fbb922091aab099b2b085))

## [1.1.41](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.40...1.1.41) (2022-05-01)


### Bug Fixes

* **nginx:** remove naxsi as it is broken ([8c39f53](https://github.com/mgomersbach/chinstrap-overlay/commit/8c39f538d14e8489c072ede6ad7cf368061b0c4a))

## [1.1.40](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.39...1.1.40) (2022-05-01)


### Bug Fixes

* **salt:** mask version with conflicting jinja ([848657d](https://github.com/mgomersbach/chinstrap-overlay/commit/848657db263fc00ebce65ff0c681001528087346))

## [1.1.39](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.38...1.1.39) (2022-02-01)


### Bug Fixes

* **su:** upstream made second booboo on small thing like su ([169bfbc](https://github.com/mgomersbach/chinstrap-overlay/commit/169bfbc810de6f85545df28cf9f871551035ab63))

## [1.1.38](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.37...1.1.38) (2022-01-04)


### Bug Fixes

* **ci:** update ci versions ([d1b9e37](https://github.com/mgomersbach/chinstrap-overlay/commit/d1b9e372082c4b45247a38c8eb397c232f35b383))
* **su:** util-linux could provide su but should not ([8d7f3b8](https://github.com/mgomersbach/chinstrap-overlay/commit/8d7f3b8793117cf05e11f1c856b26470e85fa690))

## [1.1.37](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.36...1.1.37) (2021-11-30)


### Bug Fixes

* **selinux:** last step before removing selinux profiles ([7175de3](https://github.com/mgomersbach/chinstrap-overlay/commit/7175de36eb068678a6c306a6845bf602f7045cab))

## [1.1.36](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.35...1.1.36) (2021-11-27)


### Bug Fixes

* **keyword:** keyword nomad in server profile ([cff1f5a](https://github.com/mgomersbach/chinstrap-overlay/commit/cff1f5a37bf56269d21638373c6dfc34402161b2))


### Code Refactoring

* **profiles:** move to non-selinux default ([f3673ce](https://github.com/mgomersbach/chinstrap-overlay/commit/f3673ce294096e84164e4a7e2e3996d367936e37))

## [1.1.35](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.34...1.1.35) (2021-11-20)


### Bug Fixes

* **libvirt:** add useflags to dnsmasq and add metal to server profile ([d0eed2e](https://github.com/mgomersbach/chinstrap-overlay/commit/d0eed2e0498e08407ac287be8b2349069f038224))

## [1.1.34](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.33...1.1.34) (2021-11-15)


### Bug Fixes

* **pipewire:** add keyword on wireplumber ([cd35e97](https://github.com/mgomersbach/chinstrap-overlay/commit/cd35e975df5b33d35eda86015ef8f52ed04bc59b))

## [1.1.33](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.32...1.1.33) (2021-11-15)


### Bug Fixes

* **ebuild:** use same upstream for experimental ([6cac5f9](https://github.com/mgomersbach/chinstrap-overlay/commit/6cac5f996e70d8e612a2e60353e7520b5ed1f06c))

## [1.1.32](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.31...1.1.32) (2021-11-15)


### Version Bump

* **updateworld:** version with building without merging ([aee273c](https://github.com/mgomersbach/chinstrap-overlay/commit/aee273cee57d5288b84b17f0d6831c7c87f9f172))

## [1.1.31](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.30...1.1.31) (2021-11-15)


### Bug Fixes

* **ci:** add bump ([6063130](https://github.com/mgomersbach/chinstrap-overlay/commit/6063130b999dc36d0ddfd06e8547603e350528de))

## [1.1.30](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.29...1.1.30) (2021-11-14)


### Bug Fixes

* **libvirt:** add script useflag on dnsmasq ([a3422a4](https://github.com/mgomersbach/chinstrap-overlay/commit/a3422a41056aedfb03be8f3349abbd33482cc744))

## [1.1.29](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.28...1.1.29) (2021-11-14)


### Bug Fixes

* **salt:**  does not play nice with jinja3 yet ([d480fa7](https://github.com/mgomersbach/chinstrap-overlay/commit/d480fa750aa4462a337ecb8804a133ca53ea96c6))

## [1.1.28](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.27...1.1.28) (2021-11-11)


### Bug Fixes

* **keyword:** add keyword to pyqt5 dependency ([23b4477](https://github.com/mgomersbach/chinstrap-overlay/commit/23b44771e81e31ed12d9cc64d6b62b8f72ca5980))

## [1.1.27](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.26...1.1.27) (2021-11-10)


### Bug Fixes

* **dropbear:** add useflag to libxcrypt ([f2d6fba](https://github.com/mgomersbach/chinstrap-overlay/commit/f2d6fba6aee17f453006e53668f72056b8e82afe))
* **keywords:** repair non working wildcards ([461a014](https://github.com/mgomersbach/chinstrap-overlay/commit/461a014a8d782158ad9c8e47d211b40742691312))

## [1.1.26](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.25...1.1.26) (2021-11-03)


### Bug Fixes

* **glibc:** remove mask as its no longer keyworded ([98d5e22](https://github.com/mgomersbach/chinstrap-overlay/commit/98d5e2235489bc486cdf3ecdf42b87a3e785043d))

## [1.1.25](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.24...1.1.25) (2021-09-27)


### Bug Fixes

* **amavisd-new:** add keyword on ncompress ([742fe07](https://github.com/mgomersbach/chinstrap-overlay/commit/742fe0783a428f4dfa65acc18b6a9a6888697dda))
* **composer:** move composer keywords ([4603154](https://github.com/mgomersbach/chinstrap-overlay/commit/460315421bae436cbf557e7b205feeed8c1517aa))
* **composer:** move keywords to server profile ([045e0ba](https://github.com/mgomersbach/chinstrap-overlay/commit/045e0baf251de3f092e245044e06e2ed74c6dff5))
* **dlib:** add keyword for nextcloud ([7c2b295](https://github.com/mgomersbach/chinstrap-overlay/commit/7c2b2957b96a65c42c4ddd8287539b5da48b38e7))
* **dnssec-tools:** simplify keywords ([f10ae81](https://github.com/mgomersbach/chinstrap-overlay/commit/f10ae8150094ee7d2d392c6e59fd3d08d8b31cb7))
* **exporters:** no stable tagged version in portage ([b24b76d](https://github.com/mgomersbach/chinstrap-overlay/commit/b24b76d99ada9e285806c6bc91c3300cce599458))
* **grafana-bin:** add keyword ([98f6cef](https://github.com/mgomersbach/chinstrap-overlay/commit/98f6cef2f44a655b0bed8c7f1711bcc8dbbf5f75))
* **icedtea:** add keyword ([f514406](https://github.com/mgomersbach/chinstrap-overlay/commit/f5144066615e4de170eda90a52ea09787333491d))
* **libcrypt:** add static-libs useflag for dropbear ([41658d4](https://github.com/mgomersbach/chinstrap-overlay/commit/41658d4d4dfbeb481b32a07d863bc11b629f8595))
* **lutris:** add keyword ([a70dbc2](https://github.com/mgomersbach/chinstrap-overlay/commit/a70dbc2a9b38584f59a37c6c76132c6dea3c977b))
* **mkl:** add keyword for dlib ([3247628](https://github.com/mgomersbach/chinstrap-overlay/commit/3247628afda1819e7583873a4c86358eeef90c91))
* **mupen64plus:** add keyword on PySDL2 ([30ce31e](https://github.com/mgomersbach/chinstrap-overlay/commit/30ce31edfc05198655abe0364df448f655214fe3))
* **openshot:** add useflags and keywords ([6566206](https://github.com/mgomersbach/chinstrap-overlay/commit/656620659511da17e3ebeaf49c15c1b80f59a19e))
* **podman-compose:** add keyword ([f30158f](https://github.com/mgomersbach/chinstrap-overlay/commit/f30158f9bf37a5d0129a7a4251a87807f40f95fb))
* **sunxi-tools:** add keyword ([f9e71aa](https://github.com/mgomersbach/chinstrap-overlay/commit/f9e71aa6993247047aa7d14f2cad222cafe9b546))
* **u-boot-tools:** add keyword ([053e7c9](https://github.com/mgomersbach/chinstrap-overlay/commit/053e7c9038c309179371e21c3601ee9cb06e9306))
* **wireguard:** add keyword on wireguard-tools ([d4f6282](https://github.com/mgomersbach/chinstrap-overlay/commit/d4f62820780b8fef9c2d21b91b2db83689092006))
* **wireguard:** add keyword wireguard modules ([9003eb7](https://github.com/mgomersbach/chinstrap-overlay/commit/9003eb7d4947f953317f046dd247e57398badec7))
* **xfce:** simplify xfce keyword profile ([47b869b](https://github.com/mgomersbach/chinstrap-overlay/commit/47b869b14828023718274c250f19f08269c3b3b8))

## [1.1.24](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.23...1.1.24) (2021-09-27)


### Bug Fixes

* **mariadb:** add sst-mariabackup useflag ([9f9798f](https://github.com/mgomersbach/chinstrap-overlay/commit/9f9798faf9b51a8f2d868fc2ff77f934b5f3566c))
* **openrc:** remove keyword for openrc ([c6af3f4](https://github.com/mgomersbach/chinstrap-overlay/commit/c6af3f49a1b166459ec17d12457357490d6fb3e9))
* **php:** add curl and json useflag ([54e460e](https://github.com/mgomersbach/chinstrap-overlay/commit/54e460e4d2ba105fbd9ef4d5634007662090c44a))
* **php:** move keywords ([85a5072](https://github.com/mgomersbach/chinstrap-overlay/commit/85a5072e11175d54ef1975eec0f1cd40247ff88d))
* **rtmpdump:** add keyword on rtmpdump ([2c6cc74](https://github.com/mgomersbach/chinstrap-overlay/commit/2c6cc74a73b3ac6e5c0bce861bc5ccd10a733793))

## [1.1.23](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.22...1.1.23) (2021-08-30)


### Bug Fixes

* **docker:** podman alternative for docker-compose ([1fe3783](https://github.com/mgomersbach/chinstrap-overlay/commit/1fe378363e0a3e257a08c6ea6acea2f5929e3a54))

## [1.1.22](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.21...1.1.22) (2021-08-29)


### Bug Fixes

* **at-spi2-atk:** stable does not compile with meson ([bc53cb2](https://github.com/mgomersbach/chinstrap-overlay/commit/bc53cb2fa4e361858072b314cc865e216cafb3a9))
* **nodejs:** does not build on gcc 11 with lto ([8db7048](https://github.com/mgomersbach/chinstrap-overlay/commit/8db70482fe98159823fcd70465114ffc18ea6d9b))
* **profile:** deprecate docker support ([32d742a](https://github.com/mgomersbach/chinstrap-overlay/commit/32d742add62563c46b7001ba2332cc56652667ce))

## [1.1.21](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.20...1.1.21) (2021-08-28)


### Bug Fixes

* **gentoolkit:** unmask charset_normalizer for gentoolkit ([9def042](https://github.com/mgomersbach/chinstrap-overlay/commit/9def04249655ec3913fd20a6dc11c3e358ad1cfe))
* **lapack:** need lapack on numpy for setools ([9086ab0](https://github.com/mgomersbach/chinstrap-overlay/commit/9086ab07fe1bf7134dd119a37133b2e889e7cdf5))

## [1.1.20](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.19...1.1.20) (2021-06-15)


### Bug Fixes

* **tc:** update glibc to upstream stable ([7eb00a3](https://github.com/mgomersbach/chinstrap-overlay/commit/7eb00a304e7cf4e26860fb03f033f89181d3d0ca))

## [1.1.19](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.18...1.1.19) (2021-04-28)


### Bug Fixes

* **portage:** remove local mirror as upstream ([42524ed](https://github.com/mgomersbach/chinstrap-overlay/commit/42524ed8e3fcc9b795534d8de9fdde555095c1ca))

## [1.1.18](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.17...1.1.18) (2021-04-27)


### Bug Fixes

* **glibc:** bump version ([1dec4cb](https://github.com/mgomersbach/chinstrap-overlay/commit/1dec4cba9ebe7eb774b6f03e95246b9514e4b9f2))

## [1.1.17](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.16...1.1.17) (2021-01-25)


### Bug Fixes

* **ui:** switch to more human friendly pop theme ([5dd3363](https://github.com/mgomersbach/chinstrap-overlay/commit/5dd336318ecf2c411e16a81c5f98abd8b9ac59c7))

## [1.1.16](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.15...1.1.16) (2021-01-24)


### Bug Fixes

* **glibc:** bump version ([6ab16cb](https://github.com/mgomersbach/chinstrap-overlay/commit/6ab16cb97da6b961824449b643244028e39a7807))
* **pmutils:** functionality is integrated into other components ([07d4a69](https://github.com/mgomersbach/chinstrap-overlay/commit/07d4a690bdb7bda14ddd2caa2680fd8f3726187a))

## [1.1.15](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.14...1.1.15) (2021-01-04)


### Bug Fixes

* **ci:** use fixed env ([8aed659](https://github.com/mgomersbach/chinstrap-overlay/commit/8aed659892a7ebf86230d4d881870c57784fdf29))
* **profile:** add isl to toolchain keywords ([6b61766](https://github.com/mgomersbach/chinstrap-overlay/commit/6b61766c1eab31497dff1fc34c99ba09fbc73bbd))

## [1.1.14](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.13...1.1.14) (2021-01-04)


### Bug Fixes

* **ebuilds:** update ebuilds to EAPI 7 ([0b07e9a](https://github.com/mgomersbach/chinstrap-overlay/commit/0b07e9a22c9449b7a860e3c890f30fe7b9235081))
* **ebuilds:** with new test env as well ([e7b55ef](https://github.com/mgomersbach/chinstrap-overlay/commit/e7b55efe9247b86d33a56fea7101c6ace184d442))
* **repoman:** add arch in iuse for repoman ([07e84cb](https://github.com/mgomersbach/chinstrap-overlay/commit/07e84cbf7c0ba28c8b3844f722b541343412b6f6))
* **repoman:** keywords and manifests ([2632edb](https://github.com/mgomersbach/chinstrap-overlay/commit/2632edbc8b070cc2ff76e12606a2df71f9b49dae))

## [1.1.13](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.12...1.1.13) (2021-01-04)


### Bug Fixes

* **CI:** move py version ([eee959e](https://github.com/mgomersbach/chinstrap-overlay/commit/eee959ec1fd8bfe4f9126ddade93cb67c6b76237))

## [1.1.12](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.11...1.1.12) (2020-10-11)


### Bug Fixes

* **salt:** add keyword on pycryptodomex dep ([336d14a](https://github.com/mgomersbach/chinstrap-overlay/commit/336d14a60966e20494ec983f4ce9cd4db72cfda0))

## [1.1.11](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.10...1.1.11) (2020-10-11)


### Bug Fixes

* **salt:** add keyword for msgpack dep ([9f39475](https://github.com/mgomersbach/chinstrap-overlay/commit/9f39475579e794f62ed7681488dd1a932b9146dc))

## [1.1.10](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.9...1.1.10) (2020-10-03)


### Bug Fixes

* **purple:** remove purple plugin pack useflag reference ([038a56f](https://github.com/mgomersbach/chinstrap-overlay/commit/038a56f52b7b77c3b1960ed3e3608a5d00c9306e))
* **python34:** remove old python reference ([0489eed](https://github.com/mgomersbach/chinstrap-overlay/commit/0489eed8df84a093d3b0a0c36030d8ae8e453bb1))

## [1.1.9](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.8...1.1.9) (2020-09-12)

## [1.1.8](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.7...1.1.8) (2020-09-02)


### Bug Fixes

* **useflag:** add python on libbytesize for media tags in thunar ([81385f4](https://github.com/mgomersbach/chinstrap-overlay/commit/81385f41705df5080f3ab7949f9881b2fb9e5045))

## [1.1.7](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.6...1.1.7) (2020-09-02)


### Bug Fixes

* **ebuild:** keyword xfce4-power-manager for gcc10 ([4d88d99](https://github.com/mgomersbach/chinstrap-overlay/commit/4d88d99bd9061a21f7dbfee176a3a6a70b99b82e))

## [1.1.6](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.5...1.1.6) (2020-09-02)


### Bug Fixes

* **qtstyleplugins:** add patches to build with new QT ([6267cbf](https://github.com/mgomersbach/chinstrap-overlay/commit/6267cbf5105f82bd0d15ecd5b62f2cd49660ec6d))
* **qtstyleplugins:** add patches to build with new QT ([a63fe00](https://github.com/mgomersbach/chinstrap-overlay/commit/a63fe00a656f8c132ba9017a20917a642dd31d05))

## [1.1.5](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.4...1.1.5) (2020-08-27)


### Bug Fixes

* **server:** mask pdf useflag to prevent X deps ([aaf5569](https://github.com/mgomersbach/chinstrap-overlay/commit/aaf5569d7f495fc2cadb873d6228f678e2889868))

## [1.1.4](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.3...1.1.4) (2020-08-23)


### Bug Fixes

* **profile:** move vdpau and vaapi to desktop ([909c85f](https://github.com/mgomersbach/chinstrap-overlay/commit/909c85fe157514e55a6fe1baf1f444a685f3df46))

## [1.1.3](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.2...1.1.3) (2020-08-21)

## [1.1.2](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.1...1.1.2) (2020-08-19)


### Bug Fixes

* **profile:** add keywords for gcc10 fix ([e3a086b](https://github.com/mgomersbach/chinstrap-overlay/commit/e3a086b71afb36d9f8a14104f89b1aafcca3162a))
* **profile:** add keywords for gcc10 fix ([a6fdf87](https://github.com/mgomersbach/chinstrap-overlay/commit/a6fdf878b340fd79fa59064664030ebecff71c00))

## [1.1.1](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.0...1.1.1) (2020-08-17)


### Bug Fixes

* **pecl-mcrypt:** upstream is updated ([1f13949](https://github.com/mgomersbach/chinstrap-overlay/commit/1f13949b643026c0ae09c0fae426efcbcf20bea8))

# [1.1.0](https://github.com/mgomersbach/chinstrap-overlay/compare/1.0.3...1.1.0) (2020-04-25)


### Features

* **obs:** add support for obs-studio ([5e992ce](https://github.com/mgomersbach/chinstrap-overlay/commit/5e992cebf1d68c32588eb33b12bd2ef9911c55f4))
* **obs:** add support for obs-studio ([9768a59](https://github.com/mgomersbach/chinstrap-overlay/commit/9768a5927241464394761f32f42b504a0505ed44))

## [1.0.3](https://github.com/mgomersbach/chinstrap-overlay/compare/1.0.2...1.0.3) (2020-04-24)


### Bug Fixes

* **oracle-jdk:** deprecated JVM ([f9ebcce](https://github.com/mgomersbach/chinstrap-overlay/commit/f9ebccecc61a535ababaf11f2c5961546e0f6ebe))
* **oracle-jdk:** deprecated JVM ([f235918](https://github.com/mgomersbach/chinstrap-overlay/commit/f235918c3ed2d74b3ff02a1bef2a2bf79cac14b2))

## [1.0.2](https://github.com/mgomersbach/chinstrap-overlay/compare/1.0.1...1.0.2) (2020-04-14)

## [1.0.1](https://github.com/mgomersbach/chinstrap-overlay/compare/1.0.0...1.0.1) (2020-04-14)

# 1.0.0 (2020-04-13)


### Tests

* **ghaction:** add github actions ([6ac1fd6](https://github.com/mgomersbach/chinstrap-overlay/commit/6ac1fd6e78193f7af1ee97f32c9c507aca42a795))
* **ghaction:** add github actions ([46ded04](https://github.com/mgomersbach/chinstrap-overlay/commit/46ded0496545e70b6b318ec5ef0a8dcdae1fc4be))
