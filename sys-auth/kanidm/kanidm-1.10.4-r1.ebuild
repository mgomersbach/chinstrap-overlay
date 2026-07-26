# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.25.1
	adler2@2.0.1
	aead@0.5.2
	aes-gcm@0.10.3
	aes-kw@0.2.1
	aes@0.8.4
	ahash@0.8.12
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	android_system_properties@0.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	arbitrary@1.4.2
	arc-swap@1.9.1
	argon2@0.5.3
	askama@0.15.6
	askama_derive@0.15.6
	askama_macros@0.15.6
	askama_parser@0.15.6
	askama_web@0.15.2
	askama_web_derive@0.2.0
	asn1-rs-derive@0.5.1
	asn1-rs-impl@0.2.0
	asn1-rs@0.6.2
	async-compression@0.4.42
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-trait@0.1.89
	atomic-waker@1.1.2
	authenticator@0.5.0
	autocfg@1.5.1
	aws-lc-rs@1.17.0
	aws-lc-sys@0.41.0
	axum-core@0.5.6
	axum-extra@0.12.6
	axum-htmx@0.8.1
	axum-macros@0.5.1
	axum@0.8.9
	backtrace@0.3.76
	base16ct@0.2.0
	base32@0.5.1
	base64@0.21.7
	base64@0.22.1
	base64ct@1.8.3
	base64urlsafedata@0.5.5
	base64urlsafedata@0.6.1-dev
	basic-toml@0.1.10
	bindgen@0.72.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitfield@0.17.0
	bitflags@1.3.2
	bitflags@2.13.0
	blake2@0.10.6
	block-buffer@0.10.4
	block-buffer@0.11.0
	block-buffer@0.12.1
	block-padding@0.3.3
	borrow-or-share@0.2.4
	bs58@0.5.1
	bstr@1.12.1
	bumpalo@3.20.3
	bytecount@0.6.9
	bytemuck@1.25.0
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.12.0
	cbc@0.1.2
	cc@1.2.65
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	chacha20@0.10.0
	chrono@0.4.45
	cidr@0.3.2
	cipher@0.4.4
	cipher@0.5.2
	clang-sys@1.8.1
	clap@4.6.1
	clap_builder@4.6.0
	clap_complete@4.6.5
	clap_derive@4.6.1
	clap_lex@1.1.0
	clru@0.6.3
	cmake@0.1.58
	cmov@0.5.4
	color_quant@1.1.0
	colorchoice@1.0.5
	combine@4.6.7
	compact_jwt@0.5.6
	compression-codecs@0.4.38
	compression-core@0.4.32
	concread@0.5.10
	console@0.16.3
	const-oid@0.10.2
	const-oid@0.9.6
	cookie@0.18.1
	cookie_store@0.22.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-foundation@0.9.4
	cpufeatures@0.2.17
	cpufeatures@0.3.0
	crc32fast@1.5.0
	cron@0.16.0
	crossbeam-channel@0.5.15
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crossbeam@0.8.4
	crunchy@0.2.4
	crypto-bigint@0.5.5
	crypto-common@0.1.7
	crypto-common@0.2.2
	crypto-glue@0.1.16
	csv-core@0.1.13
	csv@1.4.0
	ctr@0.9.2
	ctutils@0.4.2
	darling@0.20.11
	darling@0.23.0
	darling_core@0.20.11
	darling_core@0.23.0
	darling_macro@0.20.11
	darling_macro@0.23.0
	dashmap@6.2.1
	data-encoding@2.11.0
	defmt-macros@1.1.0
	defmt-parser@1.0.0
	defmt@1.1.0
	der-parser@9.0.0
	der@0.7.10
	der_derive@0.7.3
	deranged@0.5.8
	derive_arbitrary@1.4.2
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	devd-rs@0.3.6
	dhat@0.3.3
	dialoguer@0.12.0
	digest@0.10.7
	digest@0.11.0-rc.12
	dirs-sys@0.5.0
	dirs@6.0.0
	displaydoc@0.2.6
	document-features@0.2.12
	dunce@1.0.5
	dyn-clone@1.0.20
	ecdsa@0.16.9
	either@1.16.0
	elliptic-curve@0.13.8
	email-encoding@0.4.1
	email_address@0.2.9
	encode_unicode@1.0.0
	encoding_rs@0.8.35
	enum-iterator-derive@1.5.0
	enum-iterator@2.3.0
	enumflags2@0.7.12
	enumflags2_derive@0.7.12
	equivalent@1.0.2
	errno@0.3.14
	escargot@0.5.15
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.18.0
	faster-hex@0.10.0
	fastrand@2.4.1
	ff@0.13.1
	file-id@0.2.3
	filetime@0.2.29
	find-msvc-tools@0.1.9
	flagset@0.4.7
	flate2@1.1.9
	fluent-uri@0.4.1
	fnv@1.0.7
	foldhash@0.2.0
	form_urlencoded@1.2.2
	fraction@0.15.4
	fs_extra@1.3.0
	fsevent-sys@4.1.0
	futures-channel@0.3.32
	futures-core@0.3.32
	futures-executor@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-sink@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	futures@0.3.32
	generic-array@0.14.7
	gethostname@1.1.0
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.3
	ghash@0.5.1
	gif@0.14.2
	gimli@0.32.3
	gix-actor@0.41.1
	gix-archive@0.32.0
	gix-attributes@0.33.2
	gix-bitmap@0.3.2
	gix-blame@0.13.0
	gix-chunk@0.7.2
	gix-command@0.9.1
	gix-commitgraph@0.37.1
	gix-config-value@0.18.1
	gix-config@0.56.0
	gix-date@0.15.5
	gix-diff@0.63.0
	gix-dir@0.25.0
	gix-discover@0.51.0
	gix-error@0.2.4
	gix-features@0.48.1
	gix-filter@0.30.0
	gix-fs@0.21.2
	gix-glob@0.26.1
	gix-hash@0.25.1
	gix-hashtable@0.15.2
	gix-ignore@0.21.1
	gix-imara-diff@0.2.3
	gix-index@0.51.0
	gix-lock@23.0.1
	gix-merge@0.16.0
	gix-negotiate@0.31.0
	gix-object@0.60.0
	gix-odb@0.80.0
	gix-pack@0.70.0
	gix-packetline@0.21.5
	gix-path@0.12.1
	gix-pathspec@0.18.1
	gix-protocol@0.61.0
	gix-quote@0.7.2
	gix-ref@0.63.0
	gix-refspec@0.41.0
	gix-revision@0.45.0
	gix-revwalk@0.31.0
	gix-sec@0.14.1
	gix-shallow@0.12.1
	gix-status@0.30.0
	gix-submodule@0.30.0
	gix-tempfile@23.0.2
	gix-trace@0.1.20
	gix-transport@0.57.2
	gix-traverse@0.57.0
	gix-url@0.36.1
	gix-utils@0.3.3
	gix-validate@0.11.2
	gix-worktree-state@0.30.0
	gix-worktree-stream@0.32.0
	gix-worktree@0.52.0
	gix@0.83.0
	glob@0.3.3
	group@0.13.0
	h2@0.4.15
	half@1.8.3
	half@2.7.1
	haproxy-protocol@0.0.4
	hash32@0.3.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.16.1
	hashbrown@0.17.1
	hashlink@0.11.1
	heapless@0.8.0
	heck@0.5.0
	hermit-abi@0.5.2
	hex@0.4.3
	hkdf@0.12.4
	hmac@0.12.1
	hmac@0.13.0-rc.5
	hostname-validator@1.1.1
	hostname@0.4.2
	http-body-util@0.1.3
	http-body@1.0.1
	http-range-header@0.4.2
	http@1.4.2
	httparse@1.10.1
	httpdate@1.0.3
	hybrid-array@0.4.12
	hyper-rustls@0.27.9
	hyper-timeout@0.5.2
	hyper-util@0.1.20
	hyper@1.10.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	icu_collections@2.2.0
	icu_locale_core@2.2.0
	icu_normalizer@2.2.0
	icu_normalizer_data@2.2.0
	icu_properties@2.2.0
	icu_properties_data@2.2.0
	icu_provider@2.2.0
	ident_case@1.0.1
	idlset@0.2.5
	idna@1.1.0
	idna_adapter@1.2.2
	image-webp@0.2.4
	image@0.25.10
	indexmap@1.9.3
	indexmap@2.14.0
	inotify-sys@0.1.5
	inotify@0.11.2
	inout@0.1.4
	inout@0.2.2
	io-close@0.3.7
	ipnet@2.12.0
	is_terminal_polyfill@1.70.2
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.18
	jiff-static@0.2.29
	jiff-tzdb-platform@0.1.3
	jiff-tzdb@0.1.6
	jiff@0.2.29
	jni-macros@0.22.4
	jni-sys-macros@0.4.1
	jni-sys@0.3.1
	jni-sys@0.4.1
	jni@0.21.1
	jni@0.22.4
	jobserver@0.1.34
	js-sys@0.3.102
	jsonschema@0.46.5
	kanidm-hsm-crypto@0.3.6
	kbkdf@0.1.0-rc.1
	kqueue-sys@1.1.2
	kqueue@1.2.0
	kstring@2.0.2
	lambert_w@1.2.34
	lazy_static@1.5.0
	ldap3_client@0.8.0
	ldap3_lber@0.8.0
	ldap3_proto@0.8.0
	lettre@0.11.22
	libc@0.2.186
	libloading@0.8.9
	libm@0.2.16
	libmimalloc-sys@0.1.49
	libnss@0.9.0
	libredox@0.1.17
	libsqlite3-sys@0.37.0
	libudev-sys@0.1.4
	libudev@0.2.0
	linked-hash-map@0.5.6
	linux-raw-sys@0.12.1
	litemap@0.8.2
	litrs@1.0.0
	lock_api@0.4.14
	lodepng@3.12.2
	log@0.4.33
	lru-slab@0.1.2
	lru@0.16.4
	lru@0.17.0
	malloced@1.3.1
	matchers@0.2.0
	matchit@0.8.4
	mathru@0.16.2
	matrixmultiply@0.3.10
	maybe-async@0.2.11
	mcf@0.6.0
	md-5@0.10.6
	md4@0.10.2
	memchr@2.8.2
	memmap2@0.9.11
	memoffset@0.8.0
	micromap@0.3.0
	mimalloc@0.1.52
	mime@0.3.17
	mime_guess@2.0.5
	minimal-lexical@0.2.1
	miniz_oxide@0.8.9
	mintex@0.1.4
	mio@1.2.1
	moxcms@0.8.1
	multer@3.1.0
	nix@0.31.3
	nom@7.1.3
	nom@8.0.0
	nonempty@0.12.0
	notify-debouncer-full@0.7.0
	notify-types@2.1.0
	notify@8.2.0
	nu-ansi-term@0.50.3
	num-bigint-dig@0.8.6
	num-bigint@0.4.6
	num-cmp@0.1.0
	num-complex@0.4.6
	num-conv@0.2.2
	num-derive@0.4.2
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	num_cpus@1.17.0
	num_enum@0.7.6
	num_enum_derive@0.7.6
	num_threads@0.1.7
	oauth2@5.0.0
	objc2-core-foundation@0.3.2
	objc2-system-configuration@0.3.2
	object@0.37.3
	oid-registry@0.7.1
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	opaque-debug@0.3.1
	openssl-probe@0.2.1
	opentelemetry-http@0.31.0
	opentelemetry-otlp@0.31.1
	opentelemetry-proto@0.31.0
	opentelemetry-semantic-conventions@0.31.0
	opentelemetry@0.31.0
	opentelemetry_sdk@0.31.0
	option-ext@0.2.0
	outref@0.5.2
	p256@0.13.2
	p384@0.13.1
	p521@0.13.3
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	password-hash@0.5.0
	password-hash@0.6.1
	paste@1.0.15
	pastey@0.1.1
	pbkdf2@0.12.2
	pbkdf2@0.13.0-rc.9
	peg-macros@0.8.6
	peg-runtime@0.8.6
	peg@0.8.6
	pem-rfc7468@0.7.0
	percent-encoding@2.3.2
	phc@0.6.1
	phf@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pin-project-internal@1.1.13
	pin-project-lite@0.2.17
	pin-project@1.1.13
	pkcs1@0.7.5
	pkcs5@0.7.1
	pkcs8@0.10.2
	pkg-config@0.3.33
	polyval@0.6.2
	portable-atomic-util@0.2.7
	portable-atomic@1.13.1
	potential_utf@0.1.5
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	prctl@1.0.0
	prettyplease@0.2.37
	primeorder@0.13.6
	proc-macro-crate@3.5.0
	proc-macro-error-attr2@2.0.0
	proc-macro-error2@2.0.1
	proc-macro2@1.0.106
	procfs-core@0.18.0
	procfs@0.18.0
	prodash@31.0.0
	prost-derive@0.14.4
	prost@0.14.4
	psl-types@2.0.11
	publicsuffix@2.3.0
	pxfm@0.1.29
	qrcode@0.14.1
	quick-error@2.0.1
	quinn-proto@0.11.15
	quinn-udp@0.5.14
	quinn@0.11.11
	quote@1.0.46
	quoted_printable@0.5.2
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.10.1
	rand@0.8.6
	rand@0.9.4
	rand_chacha@0.10.0
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.10.1
	rand_core@0.6.4
	rand_core@0.9.5
	rawpointer@0.2.1
	redox_syscall@0.5.18
	redox_users@0.5.2
	ref-cast-impl@1.0.25
	ref-cast@1.0.25
	referencing@0.46.5
	regex-automata@0.4.14
	regex-syntax@0.8.11
	regex@1.12.4
	reqwest@0.12.28
	reqwest@0.13.4
	rfc6979@0.4.0
	rgb@0.8.53
	ring@0.17.14
	rpassword@5.0.1
	rsa@0.9.10
	rsqlite-vfs@0.1.1
	runloop@0.1.0
	rusqlite@0.39.0
	rust-embed-impl@8.11.0
	rust-embed-utils@8.11.0
	rust-embed@8.11.0
	rustc-demangle@0.1.27
	rustc-hash@1.1.0
	rustc-hash@2.1.2
	rustc_version@0.4.1
	rusticata-macros@4.1.0
	rustix@1.1.4
	rustls-native-certs@0.8.4
	rustls-pki-types@1.14.1
	rustls-platform-verifier-android@0.1.1
	rustls-platform-verifier@0.6.2
	rustls-platform-verifier@0.7.0
	rustls-webpki@0.103.13
	rustls@0.23.41
	rustversion@1.0.22
	ryu@1.0.23
	salsa20@0.10.2
	salsa20@0.11.0
	same-file@1.0.6
	schannel@0.1.29
	schemars@0.9.0
	schemars@1.2.1
	scopeguard@1.2.0
	scrypt@0.11.0
	sd-notify@0.5.0
	sec1@0.7.3
	security-framework-sys@2.17.0
	security-framework@3.7.0
	selinux-sys@0.7.0
	selinux@0.6.2
	semver@1.0.28
	serde-hjson@1.1.0
	serde@1.0.228
	serde_bytes@0.11.19
	serde_cbor@0.11.2
	serde_cbor_2@0.13.0
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_html_form@0.2.8
	serde_json@1.0.150
	serde_path_to_error@0.1.20
	serde_spanned@1.1.1
	serde_urlencoded@0.7.1
	serde_with@3.21.0
	serde_with_macros@3.21.0
	sha-crypt@0.5.0
	sha1-checked@0.10.0
	sha1@0.10.6
	sha2@0.10.9
	sha2@0.11.0-rc.5
	sharded-slab@0.1.7
	shell-words@1.1.1
	shellexpand@3.1.2
	shlex@1.3.0
	shlex@2.0.1
	signal-hook-registry@1.4.8
	signature@2.2.0
	simd-adler32@0.3.9
	simd_cesu8@1.1.1
	simdutf8@0.1.5
	siphasher@1.0.3
	slab@0.4.12
	smallvec@1.15.2
	smartstring@1.0.1
	smolset@1.3.1
	socket2@0.6.4
	spin@0.9.8
	spki@0.7.3
	sptr@0.3.2
	sqlite-wasm-rs@0.5.5
	sshkey-attest@0.6.1-dev
	sshkeys@0.3.4
	stable_deref_trait@1.2.1
	static_assertions@1.1.0
	strsim@0.11.1
	subtle@2.6.1
	svg@0.18.0
	syn@2.0.118
	sync_wrapper@1.0.2
	synstructure@0.13.2
	target-lexicon@0.12.16
	tempfile@3.27.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	thousands@0.2.0
	thread-tree@0.3.3
	thread_local@1.1.9
	time-core@0.1.9
	time-macros@0.2.30
	time@0.3.51
	tinystr@0.8.3
	tinyvec@1.11.0
	tinyvec_macros@0.1.1
	tls_codec@0.4.2
	tls_codec_derive@0.4.2
	tokio-macros@2.7.0
	tokio-rustls@0.26.4
	tokio-stream@0.1.18
	tokio-util@0.7.18
	tokio@1.52.3
	toml@1.1.2+spec-1.1.0
	toml_datetime@1.1.1+spec-1.1.0
	toml_edit@0.25.12+spec-1.1.0
	toml_parser@1.1.2+spec-1.1.0
	toml_writer@1.1.1+spec-1.1.0
	tonic-prost@0.14.6
	tonic@0.14.6
	tower-http@0.6.11
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing-forest@0.3.1
	tracing-log@0.2.0
	tracing-opentelemetry@0.32.1
	tracing-subscriber@0.3.23
	tracing@0.1.44
	try-lock@0.2.5
	tss-esapi-sys@0.6.0
	tss-esapi@8.0.0-alpha.2
	typenum@1.20.1
	unicase@2.9.0
	unicode-bom@2.0.3
	unicode-general-category@1.1.0
	unicode-ident@1.0.24
	unicode-normalization@0.1.25
	unicode-width@0.2.2
	universal-hash@0.5.1
	untrusted@0.9.0
	url@2.5.8
	urlencoding@2.1.3
	utf8_iter@1.0.4
	utf8parse@0.2.2
	utoipa-gen@5.5.0
	utoipa-swagger-ui-vendored@0.1.2
	utoipa-swagger-ui@9.0.2
	utoipa@5.5.0
	uuid-simd@0.8.0
	uuid@1.23.3
	valuable@0.1.1
	vcpkg@0.2.15
	version_check@0.9.5
	vsimd@0.8.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasi@0.14.7+wasi-0.2.4
	wasip2@1.0.4+wasi-0.2.12
	wasite@1.0.2
	wasm-bindgen-futures@0.4.75
	wasm-bindgen-macro-support@0.2.125
	wasm-bindgen-macro@0.2.125
	wasm-bindgen-shared@0.2.125
	wasm-bindgen@0.2.125
	web-sys@0.3.102
	web-time@1.1.0
	webauthn-attestation-ca@0.6.1-dev
	webauthn-authenticator-rs@0.6.1-dev
	webauthn-rs-core@0.6.1-dev
	webauthn-rs-proto@0.6.1-dev
	webauthn-rs@0.6.1-dev
	webpki-root-certs@1.0.8
	weezl@0.1.12
	whoami@2.1.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.52.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows@0.41.0
	windows_aarch64_gnullvm@0.41.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.41.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.41.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.41.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.41.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.41.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.41.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	winnow@0.7.15
	winnow@1.0.3
	wit-bindgen@0.57.1
	writeable@0.6.3
	x509-cert@0.2.5
	x509-parser@0.16.0
	yescrypt@0.1.0-rc.5
	yoke-derive@0.8.2
	yoke@0.8.3
	zerocopy-derive@0.8.52
	zerocopy@0.8.52
	zerofrom-derive@0.1.7
	zerofrom@0.1.8
	zeroize@1.9.0
	zeroize_derive@1.5.0
	zerotrie@0.2.4
	zerovec-derive@0.11.3
	zerovec@0.11.6
	zip@3.0.0
	zlib-rs@0.6.4
	zmij@1.0.21
	zopfli@0.8.3
	zune-core@0.5.1
	zune-jpeg@0.5.15
	zxcvbn@3.1.1
"

RUST_MIN_VER="1.93"
CHECKREQS_MEMORY="6G"
CHECKREQS_DISK_BUILD="3G"

PYTHON_COMPAT=( python3_{12,13} )
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=pdm-backend

inherit cargo check-reqs distutils-r1 systemd

DESCRIPTION="A simple, secure and fast modern identity management platform"
HOMEPAGE="https://github.com/kanidm/kanidm/"
SRC_URI="
	https://github.com/kanidm/kanidm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MPL-2.0"
# Conservative dependent-crate license superset
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 CC0-1.0
	CDLA-Permissive-2.0 ISC LGPL-3 MIT MIT-0 MPL-2.0 openssl
	Unicode-3.0 Unicode-DFS-2016 Unlicense ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="server +client +unixd +nss +pam python selinux systemd tpm"
RESTRICT="test"
REQUIRED_USE="
	|| ( server client unixd nss pam python )
	pam? ( unixd )
	nss? ( unixd )
	tpm? ( unixd )
	selinux? ( unixd )
	python? ( ${PYTHON_REQUIRED_USE} )
"

# openssl: openssl-sys links system libcrypto/libssl
# tpm2-tss: tss-esapi-sys for TPM HSM support
# libudev: webauthn-authenticator-rs (CLI token enrollment) only
# acct-{user,group}: needed for OpenRC; systemd unit uses DynamicUser=no with our user
DEPEND="
	dev-libs/openssl:=
	tpm? ( app-crypt/tpm2-tss:= )
	client? ( virtual/libudev:= )
	python? ( ${PYTHON_DEPS} )
"
RDEPEND="
	${DEPEND}
	acct-group/kanidm
	acct-user/kanidm
	pam? ( sys-libs/pam )
	selinux? ( sys-libs/libselinux )
	systemd? ( sys-apps/systemd )
	python? (
		$(python_gen_cond_dep '
			dev-python/aiohttp[${PYTHON_USEDEP}]
			dev-python/aiohttp-retry[${PYTHON_USEDEP}]
			dev-python/authlib[${PYTHON_USEDEP}]
			dev-python/pydantic[${PYTHON_USEDEP}]
			dev-python/python-dateutil[${PYTHON_USEDEP}]
			dev-python/toml[${PYTHON_USEDEP}]
			dev-python/typing-extensions[${PYTHON_USEDEP}]
		')
	)
"
BDEPEND="
	virtual/pkgconfig
	python? (
		$(python_gen_cond_dep '
			dev-python/pdm-backend[${PYTHON_USEDEP}]
			dev-python/gpep517[${PYTHON_USEDEP}]
			dev-python/installer[${PYTHON_USEDEP}]
		')
	)
"

pkg_pretend() {
	check-reqs_pkg_pretend
}

pkg_setup() {
	check-reqs_pkg_setup
	rust_pkg_setup
}

src_compile() {
	# Build only the workspace members we install. This avoids pulling in
	# orca/testkit/mail_sender/migrations which add build time without value
	# for a server deployment. Default features stay enabled — kanidm_unix_int
	# gates its binaries on its `unix` default feature.
	local pkgs=()
	use server && pkgs+=( --package daemon )
	use client && pkgs+=( --package kanidm_tools )
	use unixd  && pkgs+=( --package kanidm_unix_int )
	use pam    && pkgs+=( --package pam_kanidm )
	use nss    && pkgs+=( --package nss_kanidm )

	# Optional features only meaningfully apply to the unixd resolver
	local resolver_feats=()
	use selinux && resolver_feats+=( "kanidm_unix_int/selinux" )
	use tpm     && resolver_feats+=( "kanidm_unix_int/tpm" )

	local args=( "${pkgs[@]}" )
	if (( ${#resolver_feats[@]} )); then
		args+=( --features "$(IFS=,; echo "${resolver_feats[*]}")" )
	fi
	# release_linux compiles ABSOLUTE runtime paths into the binary
	# (server_ui_pkg_path=/usr/share/kanidm/ui/hpkg, admin sock
	# /run/kanidmd/sock, config /etc/kanidm). Without it the `developer`
	# default bakes in ../core/static + /tmp paths and kanidmd cannot
	# find its web UI assets -> refuses to start.
	local -x KANIDM_BUILD_PROFILE=release_linux
	cargo_src_compile "${args[@]}"

	if use python; then
		pushd pykanidm > /dev/null || die
		distutils-r1_src_compile
		popd > /dev/null || die
	fi
}

src_install() {
	local target_dir
	target_dir="$(cargo_target_dir)" || die

	if use server; then
		into /usr
		dosbin "${target_dir}/kanidmd"

		# Web UI static assets — kanidmd hashes these at startup and
		# refuses to boot if missing. Install to the release_linux
		# server_ui_pkg_path.
		insinto /usr/share/kanidm/ui/hpkg
		doins -r server/core/static/.

		insinto /etc/kanidm
		newins examples/server.toml server.toml.example

		# Keepdir for runtime state; permissions set by acct-user
		keepdir /var/lib/kanidm
		fowners kanidm:kanidm /var/lib/kanidm
		fperms 0750 /var/lib/kanidm

		if use systemd; then
			systemd_newunit "${FILESDIR}/kanidmd.service" kanidmd.service
		else
			newinitd "${FILESDIR}/kanidmd.initd" kanidmd
			newconfd "${FILESDIR}/kanidmd.confd" kanidmd
		fi
	fi

	if use client; then
		into /usr
		dobin "${target_dir}/kanidm"
		dobin "${target_dir}/kanidm_ssh_authorizedkeys_direct"
	fi

	if use unixd; then
		into /usr
		dosbin "${target_dir}/kanidm_unixd"
		dosbin "${target_dir}/kanidm_unixd_tasks"
		dobin "${target_dir}/kanidm_ssh_authorizedkeys"
		dobin "${target_dir}/kanidm-unix"

		insinto /etc/kanidm
		newins examples/unixd unixd.example

		keepdir /var/cache/kanidm-unixd
		fowners kanidm:kanidm /var/cache/kanidm-unixd
		fperms 0750 /var/cache/kanidm-unixd

		keepdir /var/lib/kanidm-unixd
		fowners kanidm:kanidm /var/lib/kanidm-unixd
		fperms 0750 /var/lib/kanidm-unixd

		if use systemd; then
			systemd_newunit "${FILESDIR}/kanidm-unixd.service" kanidm-unixd.service
			systemd_newunit "${FILESDIR}/kanidm-unixd-tasks.service" kanidm-unixd-tasks.service
		else
			newinitd "${FILESDIR}/kanidm-unixd.initd" kanidm-unixd
			newconfd "${FILESDIR}/kanidm-unixd.confd" kanidm-unixd
			newinitd "${FILESDIR}/kanidm-unixd-tasks.initd" kanidm-unixd-tasks
		fi
	fi

	if use pam; then
		insinto "/$(get_libdir)/security"
		insopts -m0755
		newins "${target_dir}/libpam_kanidm.so" pam_kanidm.so
	fi

	if use nss; then
		insinto "/$(get_libdir)"
		insopts -m0755
		# glibc resolves the SONAME libnss_kanidm.so.2; install with that name.
		newins "${target_dir}/libnss_kanidm.so" libnss_kanidm.so.2
	fi

	if use python; then
		pushd pykanidm > /dev/null || die
		distutils-r1_src_install
		popd > /dev/null || die
	fi

	einstalldocs
	dodoc README.md RELEASE_NOTES.md
}

pkg_postinst() {
	elog ""
	elog "Kanidm is installed. Initial setup pointers:"
	elog ""
	if ! use server; then
		elog "  Installed in client mode (no kanidmd server)."
		elog "  To run a Kanidm server on this host, re-emerge with USE=\"server\"."
		elog ""
	fi
	if use server; then
		elog "  Server config example: /etc/kanidm/server.toml.example"
		elog "  Copy to /etc/kanidm/server.toml and edit (TLS cert + key required)."
		elog "  State directory:       /var/lib/kanidm/"
		elog ""
		elog "  Initialize the database (run as the kanidm user):"
		elog "    sudo -u kanidm kanidmd database verify -c /etc/kanidm/server.toml"
		elog "    sudo -u kanidm kanidmd recover-account admin -c /etc/kanidm/server.toml"
		elog ""
		if use systemd; then
			elog "  Start: systemctl enable --now kanidmd"
		else
			elog "  Start: rc-update add kanidmd default && rc-service kanidmd start"
		fi
	fi
	if use unixd; then
		elog ""
		elog "  Unix resolver config example: /etc/kanidm/unixd.example"
		elog "  Client config (anonymous read OK): /etc/kanidm/config"
		elog ""
		if use systemd; then
			elog "  Start: systemctl enable --now kanidm-unixd kanidm-unixd-tasks"
		else
			elog "  Start: rc-update add kanidm-unixd default"
			elog "         rc-service kanidm-unixd start"
		fi
	fi
	if use nss; then
		elog ""
		elog "  NSS integration (sys-auth/nsswitch provides /etc/nsswitch.conf):"
		elog "    Edit /etc/nsswitch.conf and append 'kanidm' to the passwd, group,"
		elog "    and shadow lines, after 'files':"
		elog ""
		elog "      passwd:  files kanidm"
		elog "      group:   files kanidm"
		elog "      shadow:  files kanidm"
		elog ""
		elog "    Verify with: getent passwd <kanidm-user>"
	fi
	if use pam; then
		elog ""
		elog "  PAM integration (sys-auth/pambase provides /etc/pam.d/system-auth):"
		elog "    Gentoo has no authselect equivalent — edit the PAM stack by hand."
		elog "    A minimal addition to /etc/pam.d/system-auth:"
		elog ""
		elog "      auth     sufficient  pam_kanidm.so ignore_unknown_user"
		elog "      account  sufficient  pam_kanidm.so ignore_unknown_user"
		elog "      password sufficient  pam_kanidm.so"
		elog "      session  optional    pam_kanidm.so"
		elog ""
		elog "    Place auth/account lines BEFORE pam_unix.so, password BEFORE pam_unix.so,"
		elog "    and session anywhere in the session stack."
		elog ""
		elog "    Note: pambase rewrites /etc/pam.d/system-auth on upgrade — your"
		elog "    edits are CONFIG_PROTECT'd, so 'dispatch-conf' or 'etc-update' will"
		elog "    show the diff after each pambase bump. Re-apply your kanidm lines."
		elog ""
		elog "    Full upstream PAM stack reference:"
		elog "      https://kanidm.github.io/kanidm/stable/integrations/pam_and_nss.html"
	fi
	if use unixd; then
		elog ""
		elog "  pam_kanidm and nss_kanidm both talk to kanidm_unixd over a local"
		elog "  socket — kanidm-unixd MUST be running before user lookups will work."
	fi
	if use python; then
		elog ""
		elog "  Python client library installed:"
		elog "    import kanidm                     # main client + types"
		elog "    import kanidm_openapi_client      # generated OpenAPI client"
		elog "  Useful for integration scripts and projector daemons."
	fi
	elog ""
	elog "  Documentation: https://kanidm.github.io/kanidm/stable/"
}
