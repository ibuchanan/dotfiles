#! /usr/bin/env sh
# WSL/Linux often has C.UTF-8 but not en_US.UTF-8 generated, which causes
# "Cannot set LC_* to default locale" warnings from brew and other tools.
# macOS is fine with en_US.UTF-8.
case "$(uname -s)" in
	Linux)
		export LANG=C.UTF-8
		;;
	*)
		export LANG=en_US.UTF-8
		;;
esac
