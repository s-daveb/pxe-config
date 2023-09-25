#!/bin/sh
# Copyright © 2023 Saul D. Beniquez
# License: BSD 2-Clause

downloader=fetch

if [ "$(uname -a)" -eq "Linux" ]; then
	downloader=wget
fi


$downloader https://boot.ipxe.org/ipxe.pxe
$downloader https://boot.ipxe.org/ipxe.efi

$downloader https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe
$downloader https://boot.netboot.xyz/ipxe/netboot.xyz.efi

mv netboot.xyz.* images/

# vim: ts=8 sts=0 noet sw=8 :
