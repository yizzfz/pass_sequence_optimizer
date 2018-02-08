#!/bin/bash

set -o errexit nounset

mkdir -p download

dl () {
  if [ ! -f download/$2 ] ; then
	echo "Downloading $2 ..."
	if curl -L -C - -o download/$2.incomplete $1/$2 ; then
		mv download/$2.incomplete download/$2
	fi
  fi
}

extract () {
	loc="$1"; shift
	for x ; do
	  if [ ! -e $loc/${x/.*z*/} ] ; then
		echo "Extracting $x ..."
		case $x in
		  *tar.*gz)
			tar -xz -C $loc -f download/$x
			;;
		  *tar.*bz2|*.tbz)
			tar -xj -C $loc -f download/$x
			;;
		  *gz)
			mkdir -p $loc
			gunzip -c download/$x > $loc/${x/.gz/}
		esac
	  fi
	done
}

#dl ftp://ftp.gnu.org/gnu/gcc gcc-2.95.3.tar.gz
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-3.0.4 gcc-3.0.4.tar.gz
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-3.2.3 gcc-3.2.3.tar.bz2
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-3.4.0 gcc-3.4.0.tar.bz2
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-4.0.0 gcc-4.0.0.tar.bz2
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.0 gcc-4.1.0.tar.bz2
#dl ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.0 gcc-4.2.0.tar.bz2
dl ftp://ftp.gnu.org/gnu/gcc/gcc-4.5.1 gcc-4.5.1.tar.bz2

dl ftp://ftp.gnu.org/pub/gnu/gzip gzip-1.2.4a.tar.gz
dl http://www.bzip.org/1.0.6 bzip2-1.0.6.tar.gz
dl ftp://ftp.gnupg.org/gcrypt/gnupg gnupg-1.4.10.tar.gz
dl ftp://ftp.openssl.org/source openssl-1.0.0a.tar.gz
dl ftp://ftp.mars.org/pub/mpeg libmad-0.15.1b.tar.gz
dl ftp://ftp.mars.org/pub/mpeg madplay-0.15.2b.tar.gz
dl http://files.randombit.net/botan Botan-1.8.10.tbz
dl http://www.suse.de/~rguenther/tramp3d/ tramp3d-v4.cpp.gz
dl http://downloads.sourceforge.net/sourceforge/lame lame-3.98.4.tar.gz
# TODO use these as bench ?
#dl http://downloads.xiph.org/releases/ao libao-1.0.0.tar.gz
#dl http://downloads.xiph.org/releases/ogg libogg-1.2.0.tar.gz
#dl http://downloads.xiph.org/releases/vorbis libvorbis-1.3.1.tar.gz
#dl http://downloads.xiph.org/releases/vorbis vorbis-tools-1.4.0.tar.gz

for file in download/*; do
	file="${file##*/}"
	if [[ $file =~ gcc* ]]; then
		extract . $file
	else
		extract tests $file
	fi
done
