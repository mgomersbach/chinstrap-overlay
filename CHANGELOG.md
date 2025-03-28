# Changelog

## [1.4.22](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.21...1.4.22) (2025-03-27)


### Bug Fixes

* **ebuild:** add ebuilds for mcp-proxy ([10b3718](https://github.com/mgomersbach/chinstrap-overlay/commit/10b3718a79a27663584b846d9b4f8d2a1e999cbc))

## [1.4.21](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.20...1.4.21) (2025-01-18)


### Bug Fixes

* **dosbox:** update ebuild from guru overlay ([b08edd2](https://github.com/mgomersbach/chinstrap-overlay/commit/b08edd2921583b642caf66da3da3bfee961d2175))

## [1.4.20](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.19...1.4.20) (2025-01-17)


### Bug Fixes

* **salt:** remove mask and update to last version ([1d42a23](https://github.com/mgomersbach/chinstrap-overlay/commit/1d42a2380e99492d8c67d03b17277cb89ab731f9))

## [1.4.19](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.18...1.4.19) (2025-01-14)


### Bug Fixes

* **ebuild:** updateworld ebuild update ([d82517a](https://github.com/mgomersbach/chinstrap-overlay/commit/d82517a4e95c3f3f8bc425c8d23963ee78301406))

## [1.4.18](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.17...1.4.18) (2024-11-02)


### Bug Fixes

* **python:** python 3.13 with pgo has test failures in containers ([08e25ba](https://github.com/mgomersbach/chinstrap-overlay/commit/08e25bad0413c6cb1a6dad0e4a48f3c756ac7761))

## [1.4.17](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.16...1.4.17) (2024-11-01)


### Bug Fixes

* **fetchcommandwrapper:** allow aria2 as fetcher ([428e488](https://github.com/mgomersbach/chinstrap-overlay/commit/428e488c3797b998ccbf7c11004ad31f35e5f918))

## [1.4.16](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.15...1.4.16) (2024-10-30)


### Bug Fixes

* **dracut:** move useflag to profile ([bb0a9b8](https://github.com/mgomersbach/chinstrap-overlay/commit/bb0a9b8d803729bf02d0e246b2c97d3b44717660))

## [1.4.15](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.14...1.4.15) (2024-10-26)


### Bug Fixes

* **mesa:** keyword mesa dependency for intel ([ba72b41](https://github.com/mgomersbach/chinstrap-overlay/commit/ba72b41e299f87b65bf7fb026da35a5278f30535))

## [1.4.14](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.13...1.4.14) (2024-10-24)


### Bug Fixes

* **python:** with salt out of the way, move over to newer python 3.12 as default ([6659ad2](https://github.com/mgomersbach/chinstrap-overlay/commit/6659ad2f0aff2e4c96d69bf637a7b6c6efcba527))

## [1.4.13](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.12...1.4.13) (2024-10-22)


### Bug Fixes

* **openldap:** add sasl useflag ([1d9c0f1](https://github.com/mgomersbach/chinstrap-overlay/commit/1d9c0f1da155e612b5d85922c1522463dded9600))
* **portage:** allow distfiles download via aria2 ([1d13407](https://github.com/mgomersbach/chinstrap-overlay/commit/1d134076e984639696705e4c7189edd0f0231985))

## [1.4.12](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.11...1.4.12) (2024-10-20)


### Bug Fixes

* **updateworld:** remove salt dependency ([15c8d84](https://github.com/mgomersbach/chinstrap-overlay/commit/15c8d842eee936104414d2a74145386ef93dd83d))

## [1.4.11](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.10...1.4.11) (2024-10-14)


### Bug Fixes

* **binpkg:** set gpkg format with zstd compression ([9889d44](https://github.com/mgomersbach/chinstrap-overlay/commit/9889d4480c0c44f9d38d49745c03057e736e0cc1))
* **redis:** enable stats on allocator ([139575c](https://github.com/mgomersbach/chinstrap-overlay/commit/139575c466b2a17ce3eeb480cbdd8f194364efd4))
* **sssd:** allow auth against a active directory ([0bc70a3](https://github.com/mgomersbach/chinstrap-overlay/commit/0bc70a38ce13654137beb9065f1409cb8618c9c7))

## [1.4.10](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.9...1.4.10) (2024-10-08)


### Bug Fixes

* **abi_x86_32:** add useflags for 32 bit compat in game profile ([ade4c9c](https://github.com/mgomersbach/chinstrap-overlay/commit/ade4c9cff5e0ce27d0541ab6368eff9fec494980))
* **amdvlk:** keyword amdvlk-bin as no stable version is in portage ([419dcd3](https://github.com/mgomersbach/chinstrap-overlay/commit/419dcd3a07f22ac1ddf0e15eb3bb98d4d3308380))
* **crt:** accept keyword for cool-retro-term as no stable version is in portage ([b1ebfd6](https://github.com/mgomersbach/chinstrap-overlay/commit/b1ebfd671add6409cc037000ede9b8830a670285))
* **firefox:** vpx and nss keyworded for use in firefox ([4985f22](https://github.com/mgomersbach/chinstrap-overlay/commit/4985f22cca2943a5f183090e9f6f557ee39b2c8b))
* **games:** keywords for packages without stable version in portage ([254605f](https://github.com/mgomersbach/chinstrap-overlay/commit/254605f41e5a42059505493313ae5ded41d309a1))
* **obs:** keyword qr-code-generator as dep for obs ([a8312ff](https://github.com/mgomersbach/chinstrap-overlay/commit/a8312ff96b15ca463fe0dbc9b6316da2190b3387))
* **opencl:** apply useflags and keywords for rocm opencl ([abf3cc4](https://github.com/mgomersbach/chinstrap-overlay/commit/abf3cc40378572a6c8a43f714259ceae182a8a76))
* **shotcut:** accept keyword as there is no stable version in portage ([a26116e](https://github.com/mgomersbach/chinstrap-overlay/commit/a26116e1edc0a12b06630f92458bcbb160350051))
* **steam:** add appropriate use flags and keywords for steam and launcher ([fe3dc11](https://github.com/mgomersbach/chinstrap-overlay/commit/fe3dc114252ea6461fb9f71165648842bc5ac860))
* **toolchain:** useflags and keywords for example rust ([9a7033c](https://github.com/mgomersbach/chinstrap-overlay/commit/9a7033c2570868c23dd64ac88f711c698c5675a9))

## [1.4.9](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.8...1.4.9) (2024-10-08)


### Bug Fixes

* **mysql:** keep mariadb version as current ([d775a8f](https://github.com/mgomersbach/chinstrap-overlay/commit/d775a8fa4398905fbad8166f0a703d20ac6ab6a3))

## [1.4.8](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.7...1.4.8) (2024-10-08)


### Bug Fixes

* **ebuilds:** remove outdated ebuilds ([6ac3840](https://github.com/mgomersbach/chinstrap-overlay/commit/6ac384080ca9aed92b600d2a3e142f35cf44c7e8))
* **ffmpeg:** add amf useflag in desktop profile ([ac7f299](https://github.com/mgomersbach/chinstrap-overlay/commit/ac7f299aeb3339608a31fcd81108330529028e33))
* **ffmpeg:** add keyword for libvmaf ([304f5ce](https://github.com/mgomersbach/chinstrap-overlay/commit/304f5ce02ccd692c1f7925061d3b4f46351ef51e))
* **ffmpeg:** add missing useflags ([e5f1fd8](https://github.com/mgomersbach/chinstrap-overlay/commit/e5f1fd8a40ee618c894f763f07231e7a84c0c3c4))
* **gd:** move gd useflag to not build on glibc ([dbc27e8](https://github.com/mgomersbach/chinstrap-overlay/commit/dbc27e800b92a8d4ec5529d7bbad92aaf2b24f18))
* **mask:** remove debuginfod workaround ([c675910](https://github.com/mgomersbach/chinstrap-overlay/commit/c6759109867c0d4422c93b94aab34e113e9e21ab))
* **profile:** media profile removal bigusefile ([90f1c12](https://github.com/mgomersbach/chinstrap-overlay/commit/90f1c12dafd42ef751608731632a0bdc08e88975))
* **profile:** remove bigkeywords  file from media profile ([8043013](https://github.com/mgomersbach/chinstrap-overlay/commit/80430131d214c02499d0e88155b16919fae1ed2c))
* **profile:** remove bigkeywords file from gaming profile ([6f97bcb](https://github.com/mgomersbach/chinstrap-overlay/commit/6f97bcb8a96b9141b4be932ab6ebbfb3c81176eb))
* **profile:** remove bigkeywords file from server profile ([3006ed2](https://github.com/mgomersbach/chinstrap-overlay/commit/3006ed29b7a6eeb44e6c949961bcaefee2723200))
* **profile:** remove bigkeywordsfile from metal profile ([76880bc](https://github.com/mgomersbach/chinstrap-overlay/commit/76880bc45a406ec25ec6be6828d78d8a537200f6))
* **profile:** remove bigkeywordsfile in base profile ([ee4873d](https://github.com/mgomersbach/chinstrap-overlay/commit/ee4873d7ae33540a7e6f32cfd2174d94721750a4))
* **profile:** remove bigunmaskfile from metal profile ([847cd7e](https://github.com/mgomersbach/chinstrap-overlay/commit/847cd7ea716d505cdde4b052e6f7d842fecd1b0d))
* **profile:** remove bigusefile from metal profile ([8be5252](https://github.com/mgomersbach/chinstrap-overlay/commit/8be52523ceca4196e929824aa6eeab70e7a5f1cd))
* **profile:** remove bigusefile from security profile ([abc017f](https://github.com/mgomersbach/chinstrap-overlay/commit/abc017f412f3ab7dc03b554d7dc24a05c6064c25))
* **profile:** remove selinux reference in security profile ([f8a908f](https://github.com/mgomersbach/chinstrap-overlay/commit/f8a908fc2417e2766f99b1f1fe817c9e48de3870))

## [1.4.7](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.6...1.4.7) (2024-09-15)


### Bug Fixes

* **esteam:** keyword game-device-udev-rules ([048c797](https://github.com/mgomersbach/chinstrap-overlay/commit/048c79728390da7a2a66543a35b1dbf19d6bc1a4))
* **firefox:** add system-png useflag ([4641a47](https://github.com/mgomersbach/chinstrap-overlay/commit/4641a478d774e68778889e5b34ea4a36a5828e52))
* **firefox:** remove pgo mask ([51be466](https://github.com/mgomersbach/chinstrap-overlay/commit/51be466f6eea1fe4b1434eafedd5f9f3be80e5b1))
* **lldpd:** keyword lldpd ([18a342b](https://github.com/mgomersbach/chinstrap-overlay/commit/18a342b452bcfc516c0671530ac96e06e4a06ca5))
* **mpv:** add useflags for mpv ([5e26ead](https://github.com/mgomersbach/chinstrap-overlay/commit/5e26ead444f60710681caaa8440ddfae3a1e3420))
* **repo:** move firefox useflags ([69a30cc](https://github.com/mgomersbach/chinstrap-overlay/commit/69a30cc7e477bcfa0ac562737c85fe1a1a96d3a6))
* **repo:** move ngtcp useflag change to firefox file ([4c7c8ce](https://github.com/mgomersbach/chinstrap-overlay/commit/4c7c8ced491d9a9adbb48935e67adf946ea79bdc))
* **repo:** move useflags to their according files ([03a8eaa](https://github.com/mgomersbach/chinstrap-overlay/commit/03a8eaaafe9fe8877430242aabeb32f915d16b2f))
* **salt:** keyword backports-ssl-match-hostname ([c870765](https://github.com/mgomersbach/chinstrap-overlay/commit/c870765e071a07bbf1f4921b2561b3ec05267866))
* **samba:** add kerberos useflag for cyrus-sasl ([5571c12](https://github.com/mgomersbach/chinstrap-overlay/commit/5571c1291b2cfea886911c0470030499ed2d8a12))

## [1.4.6](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.5...1.4.6) (2024-07-19)


### Bug Fixes

* **plymouth-openrc:** move keyword ([815c1b3](https://github.com/mgomersbach/chinstrap-overlay/commit/815c1b3e52f29e05648a4c719eddc423e43f7168))

## [1.4.5](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.4...1.4.5) (2024-07-12)


### Bug Fixes

* **profile:** Update keywords and useflags for kodi machines ([2812851](https://github.com/mgomersbach/chinstrap-overlay/commit/2812851cd26f0a0bfc64cc8ad12cb53b46566bc3))

## [1.4.4](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.3...1.4.4) (2024-06-14)


### Bug Fixes

* **profile:** second step in move ([2b75cc7](https://github.com/mgomersbach/chinstrap-overlay/commit/2b75cc73082ebf5e8d5eb4e1afd16dade0878037))

## [1.4.3](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.2...1.4.3) (2024-06-03)


### Bug Fixes

* **profile:** Move to profile 23.0 step 1 of 2 with split-usr ([6849f05](https://github.com/mgomersbach/chinstrap-overlay/commit/6849f050487a904440a94212c02c5ee25ba1e171))

## [1.4.2](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.1...1.4.2) (2024-05-16)


### Bug Fixes

* **pipewire:** add keyword as dep of qemu ([b911f43](https://github.com/mgomersbach/chinstrap-overlay/commit/b911f43f83e4db2869b16f1c33d2ac719c1faf58))

## [1.4.1](https://github.com/mgomersbach/chinstrap-overlay/compare/1.4.0...1.4.1) (2024-04-14)


### Bug Fixes

* **python:** align PYTHON_SINGLE_TARGET with upstream and add 12 ([3e658d7](https://github.com/mgomersbach/chinstrap-overlay/commit/3e658d7c5302edc30bc9160bb95ba02580da1f7d))

# [1.4.0](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.57...1.4.0) (2024-04-13)


### Features

* **profile:** switch default profile on arm64 ([0b78d48](https://github.com/mgomersbach/chinstrap-overlay/commit/0b78d483219ca39e76cc0880385ca7117b3f62ab))

## [1.3.57](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.56...1.3.57) (2024-04-07)


### Bug Fixes

* **suricata:** add control socket and lua support ([320e354](https://github.com/mgomersbach/chinstrap-overlay/commit/320e354abd77491b5e65fea77038b4cf7e949013))

## [1.3.56](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.55...1.3.56) (2024-03-30)


### Bug Fixes

* **podman:** more deps keywording ([9169b52](https://github.com/mgomersbach/chinstrap-overlay/commit/9169b52fb3df7cf2e61a01b4365520429e2ad016))

## [1.3.55](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.54...1.3.55) (2024-03-30)


### Bug Fixes

* **podman:** add keywords for podman dependencies ([5e30a9d](https://github.com/mgomersbach/chinstrap-overlay/commit/5e30a9d6e4740244ec45049396ed71e144a6051d))

## [1.3.54](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.53...1.3.54) (2024-03-30)


### Bug Fixes

* **category:** adjust containers category name move ([4afeaf2](https://github.com/mgomersbach/chinstrap-overlay/commit/4afeaf2f2252543f56fc42e5463b5a00db6ec818))

## [1.3.53](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.52...1.3.53) (2024-03-30)


### Bug Fixes

* **ids:** add use and keywords for suricata and snort ([67a2b97](https://github.com/mgomersbach/chinstrap-overlay/commit/67a2b972955e4ddc8224fe2304920127c0abe6bf))

## [1.3.52](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.51...1.3.52) (2024-03-30)


### Bug Fixes

* **bind:** add xml useflag for exporter ([9778409](https://github.com/mgomersbach/chinstrap-overlay/commit/9778409d0c9a92e30a1357502b030b0278ecc348))

## [1.3.51](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.50...1.3.51) (2024-03-21)


### Bug Fixes

* **biguse:** remove a old bigusefile ([94e21b7](https://github.com/mgomersbach/chinstrap-overlay/commit/94e21b7031d3088cce4feed99cf7288e22030a36))

## [1.3.50](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.49...1.3.50) (2024-03-21)


### Bug Fixes

* **nginx:** add geoip2 useflag for vts ([e308216](https://github.com/mgomersbach/chinstrap-overlay/commit/e3082169cc01f8da9acc4c53149b498d923d7a34))

## [1.3.49](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.48...1.3.49) (2024-03-16)


### Bug Fixes

* **php:** add sysvipc useflag ([6fda5ff](https://github.com/mgomersbach/chinstrap-overlay/commit/6fda5ff6b1dce9a30fbdeb00bf70cc8a808cf433))

## [1.3.48](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.47...1.3.48) (2024-02-28)


### Bug Fixes

* **salt:** unblock higher version for test ([3f1e9a2](https://github.com/mgomersbach/chinstrap-overlay/commit/3f1e9a2ec9b02fa4ef05c6832eb3fc996e731a71))

## [1.3.47](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.46...1.3.47) (2023-11-22)


### Bug Fixes

* **podman-compose:** pypi mirror upstream replaced with github ([677b4fd](https://github.com/mgomersbach/chinstrap-overlay/commit/677b4fde5a6201655a0d7ee82708b64ac41e2163))

## [1.3.46](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.45...1.3.46) (2023-10-03)


### Bug Fixes

* **dosboox-x:** keyword openglide ([ae633b2](https://github.com/mgomersbach/chinstrap-overlay/commit/ae633b29f43ff3d1393a89cccfe939390ce55cb0))
* **pigz:** keyword to zlib compat version ([13584a4](https://github.com/mgomersbach/chinstrap-overlay/commit/13584a4a367de3198df53cc330f37dffc776b65b))

## [1.3.45](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.44...1.3.45) (2023-09-28)


### Bug Fixes

* **lldpd:** add missing useflags for lldpd ([f4f96de](https://github.com/mgomersbach/chinstrap-overlay/commit/f4f96dee41abbb0fc9fd45f1580e66a77752d058))

## [1.3.44](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.43...1.3.44) (2023-09-20)


### Bug Fixes

* **ebuild:** update ebuild for eapi 8 ([5db17b3](https://github.com/mgomersbach/chinstrap-overlay/commit/5db17b35fa82becb1e8385c95e22a92e725bacae))

## [1.3.43](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.42...1.3.43) (2023-09-19)


### Bug Fixes

* **eapi:** straighten eapi versions and useflag cleanup ([94b312e](https://github.com/mgomersbach/chinstrap-overlay/commit/94b312e74847a803dc44c2fbd58c94d99b06499b))

## [1.3.42](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.41...1.3.42) (2023-08-25)


### Bug Fixes

* **flags:** catch up on new install ([f8451de](https://github.com/mgomersbach/chinstrap-overlay/commit/f8451dea827ad35a9603a0738997b92ae5a5a880))

## [1.3.41](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.40...1.3.41) (2023-08-25)


### Bug Fixes

* **libvirt:** remove parted useflag ([a4cecd6](https://github.com/mgomersbach/chinstrap-overlay/commit/a4cecd604fe13b35028e261d8a3a384c177d85d8))

## [1.3.40](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.39...1.3.40) (2023-08-23)


### Bug Fixes

* **gluster:** remove keyword ([ce39a4d](https://github.com/mgomersbach/chinstrap-overlay/commit/ce39a4dd53251cd3767ee83b25c284a57510795a))

## [1.3.39](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.38...1.3.39) (2023-08-02)


### Bug Fixes

* **pdlib:** correct package name for dlib dep ([47878ae](https://github.com/mgomersbach/chinstrap-overlay/commit/47878ae964fdba0be9f4609dadb9d2a259ed7266))

## [1.3.38](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.37...1.3.38) (2023-08-02)


### Bug Fixes

* **pdlib:** add pdlib ebuild and keyword for face recogniztion ([6664002](https://github.com/mgomersbach/chinstrap-overlay/commit/666400294f85c8d2a7becf21a3544cf98823bbd8))

## [1.3.37](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.36...1.3.37) (2023-05-02)


### Version Bump

* **python:** python 3.9 no longer needed ([ba7c2d9](https://github.com/mgomersbach/chinstrap-overlay/commit/ba7c2d93eecbae08ad980069b897ba89ae32b62d))

## [1.3.36](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.35...1.3.36) (2023-02-28)


### Bug Fixes

* **32bit:** add 32bit useflags in profile ([663a389](https://github.com/mgomersbach/chinstrap-overlay/commit/663a38993d6e1f3ba89fc750bd5d6f012a967dad))

## [1.3.35](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.34...1.3.35) (2023-02-24)


### Bug Fixes

* **pipewire:** add extra useflag for ffmpeg on pipewire ([9d15f71](https://github.com/mgomersbach/chinstrap-overlay/commit/9d15f7112e8364f9ef7702e84cb52b6878ae4e2b))

## [1.3.34](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.33...1.3.34) (2023-01-26)


### Bug Fixes

* **profile:** add needed 32bit flags in gaming profile for pipewire ([81bcdc8](https://github.com/mgomersbach/chinstrap-overlay/commit/81bcdc877e6e6c8fdeb30e247b22de883a3b1383))

## [1.3.33](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.32...1.3.33) (2023-01-26)


### Bug Fixes

* **profile:** fix symlinks in workstation profile ([899687c](https://github.com/mgomersbach/chinstrap-overlay/commit/899687c0705cfd073ecb5739847e01d776c724ff))

## [1.3.32](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.31...1.3.32) (2023-01-26)


### Bug Fixes

* **ci:** add gitlab build hook ([a007b0b](https://github.com/mgomersbach/chinstrap-overlay/commit/a007b0be093974cdc52c95a0f1f0082a765cb056))
* **ci:** set host instead of url in action ([79b1ebc](https://github.com/mgomersbach/chinstrap-overlay/commit/79b1ebceb84bde92261b505229fe82de09864be8))

## [1.3.31](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.30...1.3.31) (2023-01-26)


### Bug Fixes

* **profile:** move markws to workstation ([ea26ec1](https://github.com/mgomersbach/chinstrap-overlay/commit/ea26ec1c2b5e0ce2990a09a392d3d0f5c5a33a10))

## [1.3.30](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.29...1.3.30) (2023-01-25)


### Bug Fixes

* **32bit:** add abi_x86_32 on lv2 in gaming profile ([2ae6c45](https://github.com/mgomersbach/chinstrap-overlay/commit/2ae6c45985e3839b7315c63788a2d453a247513e))

## [1.3.29](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.28...1.3.29) (2023-01-25)


### Bug Fixes

* **profile:** update media profile and add jack support ([9da58bf](https://github.com/mgomersbach/chinstrap-overlay/commit/9da58bf143356b9bf741038784976168f9184ee7))

## [1.3.28](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.27...1.3.28) (2023-01-22)


### Bug Fixes

* **keyword:** syntax not supported in profile but is locally ([fdb345f](https://github.com/mgomersbach/chinstrap-overlay/commit/fdb345f4e1835eadd0202a7f415c1d96bedeee00))

## [1.3.27](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.26...1.3.27) (2023-01-17)


### Bug Fixes

* **eapi:** move to eapi 8 ([15215d8](https://github.com/mgomersbach/chinstrap-overlay/commit/15215d829c8bdaa1c4c2e8c351008910aabcd2d1))

## [1.3.26](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.25...1.3.26) (2023-01-17)


### Bug Fixes

* **qt:** move wildcard to simpler format for qt ([341339c](https://github.com/mgomersbach/chinstrap-overlay/commit/341339c59a1aab0b19fa468d5862b034cb2caec9))

## [1.3.25](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.24...1.3.25) (2023-01-16)


### Bug Fixes

* **binutils:** remove binutils-libs keyword too ([f61f1ca](https://github.com/mgomersbach/chinstrap-overlay/commit/f61f1ca1a95eb14b9eb3e5bf0073c5913977138e))

## [1.3.24](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.23...1.3.24) (2023-01-16)


### Bug Fixes

* **binutils:** 2.40 has errors, so reverting to stable ([1ef8cec](https://github.com/mgomersbach/chinstrap-overlay/commit/1ef8cecf76b326f8b84022e9761130b188ca8fa0))

## [1.3.23](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.22...1.3.23) (2023-01-16)


### Bug Fixes

* **binutils:** 2.40 has errors, so reverting to stable ([930cb55](https://github.com/mgomersbach/chinstrap-overlay/commit/930cb5557607ad4045ad4579b3472c907af8d7ae))

## [1.3.22](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.21...1.3.22) (2023-01-11)


### Bug Fixes

* **binpkgs:** update binpkg urls ([4f2e0ad](https://github.com/mgomersbach/chinstrap-overlay/commit/4f2e0ad7e0d305cf5463b57626c8851813b32953))

## [1.3.21](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.20...1.3.21) (2023-01-08)


### Bug Fixes

* **pidgin:** telegram ebuild is no longer provided ([8676f4b](https://github.com/mgomersbach/chinstrap-overlay/commit/8676f4b133a105c9d71182f701eb8553e9c42c67))

## [1.3.20](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.19...1.3.20) (2023-01-08)


### Bug Fixes

* **cups:** add lcms useflag to poppler ([f8ba4ab](https://github.com/mgomersbach/chinstrap-overlay/commit/f8ba4abc5cf188d2d50e4840d6b13bf6e1b54be7))

## [1.3.19](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.18...1.3.19) (2023-01-07)


### Bug Fixes

* **llvm:** add keyword to llvm-toolchain-symlinks in toolchain ([e5030e1](https://github.com/mgomersbach/chinstrap-overlay/commit/e5030e1818189a0d1e7026e36f8165545baad434))
* **lvm:** add thin ([22729bc](https://github.com/mgomersbach/chinstrap-overlay/commit/22729bcb0d9e20c7d9f485fd88ef2735e50a1b32))

## [1.3.18](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.17...1.3.18) (2023-01-06)


### Bug Fixes

* **nginx:** add nginx useflag on mime-types ([30df15c](https://github.com/mgomersbach/chinstrap-overlay/commit/30df15c87c4f1a93fd297d3af830684c8b652841))

## [1.3.17](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.16...1.3.17) (2023-01-06)


### Bug Fixes

* **pipewire:** add pipewire global useflag in media profile ([775cf99](https://github.com/mgomersbach/chinstrap-overlay/commit/775cf9914e955275e65a2e8e1748e895e8ca1188))

## [1.3.16](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.15...1.3.16) (2023-01-06)


### Bug Fixes

* **cgo:** typo in cgo flags name ([294ffe4](https://github.com/mgomersbach/chinstrap-overlay/commit/294ffe4a0e52c349a8d40d41b61a34f8b870f5ff))

## [1.3.15](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.14...1.3.15) (2023-01-06)


### Bug Fixes

* **tcltk:** keep them in tandem ([6682fe5](https://github.com/mgomersbach/chinstrap-overlay/commit/6682fe55cf9c894e113d7a0df9b47b735960e515))

## [1.3.14](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.13...1.3.14) (2023-01-06)


### Bug Fixes

* **cflags:** remove dumb O3 ([b9b4589](https://github.com/mgomersbach/chinstrap-overlay/commit/b9b4589c2e6c77903f634556656948710bbd7365))

## [1.3.13](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.12...1.3.13) (2023-01-06)


### Bug Fixes

* **libvirt:** readd lvm ([5b95a65](https://github.com/mgomersbach/chinstrap-overlay/commit/5b95a65b2c037088e20afdaaa3c0bd554b911dd3))

## [1.3.12](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.11...1.3.12) (2023-01-06)


### Bug Fixes

* **profiles:** fix order of vars ([77d91d4](https://github.com/mgomersbach/chinstrap-overlay/commit/77d91d49094f6a7fad6d3fd94923a1203a57a695))

## [1.3.11](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.10...1.3.11) (2023-01-05)


### Bug Fixes

* **libvirt:** remove lvm useflag ([e375e01](https://github.com/mgomersbach/chinstrap-overlay/commit/e375e01d9fa2b9457fa29c0d324691784cabe2a6))

## [1.3.10](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.9...1.3.10) (2023-01-05)


### Bug Fixes

* **cflags:** inherit in parent ([57bc4af](https://github.com/mgomersbach/chinstrap-overlay/commit/57bc4af65aa37e394756e3917dcde04d680267b3))

## [1.3.9](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.8...1.3.9) (2023-01-05)


### Bug Fixes

* **flags:** add golang and  rust flags ([bd91d52](https://github.com/mgomersbach/chinstrap-overlay/commit/bd91d52898ae5dcaee8a131580e9b87fd4b0e1aa))

## [1.3.8](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.7...1.3.8) (2023-01-05)


### Bug Fixes

* **binpkg:** max compress for write-once-read-many ([eea5bf6](https://github.com/mgomersbach/chinstrap-overlay/commit/eea5bf66ea2b370547fb1e8ce70e5422e4183f1c))

## [1.3.7](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.6...1.3.7) (2023-01-05)


### Bug Fixes

* **cflags:** move cflag derivates ([6ae6386](https://github.com/mgomersbach/chinstrap-overlay/commit/6ae638680e5774336c014a055f09d46c06e33d37))

## [1.3.6](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.5...1.3.6) (2023-01-05)


### Bug Fixes

* **binhost:** fix base binhost url ([c522216](https://github.com/mgomersbach/chinstrap-overlay/commit/c5222165a7c289fb813d250b4546b25d86f18b82))

## [1.3.5](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.4...1.3.5) (2023-01-05)


### Bug Fixes

* **binhost:** missed quote ([bf62926](https://github.com/mgomersbach/chinstrap-overlay/commit/bf629269015db9f82e257e46f340498a04bb5692))

## [1.3.4](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.3...1.3.4) (2023-01-05)


### Bug Fixes

* **binhost:** add base binhost ([ad67e32](https://github.com/mgomersbach/chinstrap-overlay/commit/ad67e32fd99251c7123ea6383f3eec98ad7b536e))

## [1.3.3](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.2...1.3.3) (2023-01-05)


### Bug Fixes

* **binhost:** correct arm64 upstream and x86_64 ([e490f4a](https://github.com/mgomersbach/chinstrap-overlay/commit/e490f4ac2fcddac657a7d970080256db6bc55d52))

## [1.3.2](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.1...1.3.2) (2023-01-04)


### Bug Fixes

* **python:** upstream stable has moved ([bc58313](https://github.com/mgomersbach/chinstrap-overlay/commit/bc58313a177ad9a2da086154b2265d5625cf7b91))

## [1.3.1](https://github.com/mgomersbach/chinstrap-overlay/compare/1.3.0...1.3.1) (2022-12-30)


### Bug Fixes

* **alternatives:** remove symlink and add on pkg ([b709442](https://github.com/mgomersbach/chinstrap-overlay/commit/b7094422cf84e85a88a01f3db43524f03b6de53a))

# [1.3.0](https://github.com/mgomersbach/chinstrap-overlay/compare/1.2.2...1.3.0) (2022-12-16)


### Bug Fixes

* **cflags:** remove from base profile ([ba9942e](https://github.com/mgomersbach/chinstrap-overlay/commit/ba9942e78ab701a2cbe18cc715aaf92b584fa056))
* **profile:** markws profile without buildhelper ([82f234c](https://github.com/mgomersbach/chinstrap-overlay/commit/82f234c20298f75490dbb5195e3749c7ebed7261))
* **profiles:** remove buildhelper and update binpkg urls ([510799c](https://github.com/mgomersbach/chinstrap-overlay/commit/510799c0617ea639608d5292015287d69130300c))
* **profiles:** remove selinux and add symlinks ([2ffeb7a](https://github.com/mgomersbach/chinstrap-overlay/commit/2ffeb7a767d54d929366f20eab9b940e11bc62f2))


### Features

* **cflags:** add mfpath both as default ([ed659b1](https://github.com/mgomersbach/chinstrap-overlay/commit/ed659b1761f72afefdc474f49bcddba9db9cb019))

## [1.2.2](https://github.com/mgomersbach/chinstrap-overlay/compare/1.2.1...1.2.2) (2022-11-17)


### Bug Fixes

* **profile:** arm64 still on 17 ([0f65c9e](https://github.com/mgomersbach/chinstrap-overlay/commit/0f65c9ed087baf3cacf79e91c0cc8d1ba770a3a5))

## [1.2.1](https://github.com/mgomersbach/chinstrap-overlay/compare/1.2.0...1.2.1) (2022-11-17)


### Bug Fixes

* **subprofiles:** add subprofiles for arm64 ([d59e808](https://github.com/mgomersbach/chinstrap-overlay/commit/d59e808304823da0e4aa8a6cb79d7d033577f7eb))

# [1.2.0](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.57...1.2.0) (2022-11-17)


### Features

* **arch:** add arm64 profiles ([c834410](https://github.com/mgomersbach/chinstrap-overlay/commit/c8344104ab6452198c76836b04eaf2f134869d06))

## [1.1.57](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.56...1.1.57) (2022-10-02)


### Bug Fixes

* **python:** set python set explicitly ([7732006](https://github.com/mgomersbach/chinstrap-overlay/commit/773200669b656d39c8e5b2392fe0d44392bd890c))

## [1.1.56](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.55...1.1.56) (2022-10-01)


### Bug Fixes

* **salt:** move keyword to correct file ([b1acf62](https://github.com/mgomersbach/chinstrap-overlay/commit/b1acf6264d4359d2118e9e6d37fc3f7218c29308))

## [1.1.55](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.54...1.1.55) (2022-10-01)


### Bug Fixes

* **hwloc:** remove mask ([3584988](https://github.com/mgomersbach/chinstrap-overlay/commit/35849887f87fd208483f5ff2cd6aef9aaa8087f7))
* **salt:** add keyword for dependency for salt ([8ddf61a](https://github.com/mgomersbach/chinstrap-overlay/commit/8ddf61a5a3f2165d5aa58494cd152d32d5e01dec))

## [1.1.54](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.53...1.1.54) (2022-09-30)


### Bug Fixes

* **salt:** add python useflag on brotli for salt ([3c454ef](https://github.com/mgomersbach/chinstrap-overlay/commit/3c454ef9da8a3c550accc202e4082b8995755786))

## [1.1.53](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.52...1.1.53) (2022-09-30)


### Bug Fixes

* **salt:** jinja matured ([bca2dd2](https://github.com/mgomersbach/chinstrap-overlay/commit/bca2dd24473df09fc9b01bfb67d1469d98e1119c))

## [1.1.52](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.51...1.1.52) (2022-09-30)


### Bug Fixes

* **qemu:** add bin dependencies ([3646988](https://github.com/mgomersbach/chinstrap-overlay/commit/3646988c787ec69fd6b0670e3be160b246191bd3))

## [1.1.51](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.50...1.1.51) (2022-09-29)


### Bug Fixes

* **poppler:** jpeg2k is old and does not play nicely ([24a3cce](https://github.com/mgomersbach/chinstrap-overlay/commit/24a3cce5800140debbb682f1e62615216ed86f67))

## [1.1.50](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.49...1.1.50) (2022-09-29)


### Bug Fixes

* **cgi:** move cgi useflag to pkg ([0acf790](https://github.com/mgomersbach/chinstrap-overlay/commit/0acf79085349eaddedacd7e116f3938b1a212135))

## [1.1.49](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.48...1.1.49) (2022-09-13)


### Bug Fixes

* **firefox:** dont force clang as firefox always lags behind ([a976308](https://github.com/mgomersbach/chinstrap-overlay/commit/a97630820e304896b375edc89dd70367ce0c0a90))

## [1.1.48](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.47...1.1.48) (2022-08-16)


### Bug Fixes

* **steam:** set stack-realign for some 32bit sse games ([824259b](https://github.com/mgomersbach/chinstrap-overlay/commit/824259ba6f6e27606018c72d2604f26c4fdd8a9f))

## [1.1.47](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.46...1.1.47) (2022-07-09)


### Bug Fixes

* **xfdashboard:** add gles2 useflag for xfdashboard ([309559b](https://github.com/mgomersbach/chinstrap-overlay/commit/309559b4982a0bdbb914e0670ef3f0aeeda581bb))

## [1.1.46](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.45...1.1.46) (2022-06-07)


### Bug Fixes

* **32bit:** add abi_x86_32 to pkgs in game profile ([d154ead](https://github.com/mgomersbach/chinstrap-overlay/commit/d154ead3cd24a788fa3aa44b17abdd7fcb938a23))
* **sphinx:** remove odd dependencies on sphinx ([cb7f226](https://github.com/mgomersbach/chinstrap-overlay/commit/cb7f226c6d794bed0841697c2ad5f14b4997614f))

## [1.1.45](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.44...1.1.45) (2022-06-04)


### Bug Fixes

* **geany:** remove after switch to vscode ([293f028](https://github.com/mgomersbach/chinstrap-overlay/commit/293f028d15922fe89693518a72ca8fa3f8f4ae30))

## [1.1.44](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.43...1.1.44) (2022-05-09)


### Bug Fixes

* **blockers:** keyword ctop and blackbox_exporter ([58fb877](https://github.com/mgomersbach/chinstrap-overlay/commit/58fb877b12bde961310af55d69a3f3953afdae5c))

## [1.1.43](https://github.com/mgomersbach/chinstrap-overlay/compare/1.1.42...1.1.43) (2022-05-09)


### Bug Fixes

* **salt:** mask incompatible version ([f596b91](https://github.com/mgomersbach/chinstrap-overlay/commit/f596b916ce37d7f3a8f2551ab4ba9f42e1da9a1b))

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
