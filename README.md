# PXE Boot Configuration Repository

This Git repository contains configuration files and scripts for setting up PXE boot using DNSMasq, Lighttpd, TFTP-HPA, and Netboot.xyz. This is meant to run on FreeBSD systems but can be adapted to work with Linux or any UNIX that can run Dnsmasq as a proxying DHCP server.

Configuration is done using  FreeBSD's `rc.conf` for network booting. Please follow the instructions below to set up your PXE boot environment. 
## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Repository Contents](#repository-contents)
- [Configuration](#configuration)
- [Usage](#usage)
- [License](#license)
## Introduction

PXE (Preboot eXecution Environment) booting allows you to boot and install operating systems over the network. This repository provides a streamlined configuration for setting up a server providing PXE boot service using netboot.xyz, using DNSMasq and TFTP-HPA on a FreeBSD system. Additionally, it includes configurations for the `rc.conf` file to enable network booting on FreeBSD.

To ensure compliance with GPL licenses, this repository does not include iPXE and Netboot.xyz binaries. Instead, a shell script is provided that can download these binaries for you.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- A FreeBSD system (tested on FreeBSD 13.2)
- dnsmasq and optionally tftpd-hpa 
- Storage for your PXE-boot binaries
- Administrative privileges on the FreeBSD system
- Internet connectivity on the FreeBSD system
- A network segment for PXE boot clients

## Repository Contents

- **etc/dnsmaqs-dhcp.conf**: DNSMasq configuration file for DHCP and TFTP boot.
- **etc/rc.conf.local**: Example `rc.conf` file for enabling network booting on FreeBSD.
- **download-ipxe-netboot.sh**: Shell script to download iPXE and Netboot.xyz binaries.

## Prerequisites

1. Clone this Git repository to your FreeBSD system:

   ```shell
   git clone https://github.com/yourusername/pxe-boot-config.git
   ```

2. Install the following packages `dnsmasq` , `tftpd-hpa`
   ```shell
   pkg install dnsmasq tftp
   # optional:
   pkg install ipxe 
   # go to /usr/local/share/ipxe for ipxe binaries
   ```

3. Copy the `netboot` folder in this configuration to `/netboot` or elsewhere. If you choose elsewhere, be sure to modify the files under `etc` to have the correct referneces. 
4. Deploy the following configuration files at `/usr/local/etc` or `/etc/` 
- **/usr/local/etc/dnsmaqs-dhcp.conf**: Update DHCP settings and paths as needed.
- **/etc/rc.conf.local**: (FreeBSD only) Configure daemons and services required

## Usage

Follow these steps to set up PXE booting on your FreeBSD system:

1. Install dependencies and set up  the configuration files as described in the [Prerequisites](#prerequisites) section.

2. Run the `download-ipxe-netboot.sh` script to download iPXE and Netboot.xyz binaries. This script will fetch the necessary binaries and place them in the appropriate directories.

   ```shell
   ./download-ipxe-netboot.sh
   ```


3. Start and enable the DNSMasq and TFTP services:

   ```shell
   sudo service dnsmasq enable
   sudo service dnsmasq start
   
   # Optional: You may use the dnsmasq-provided tftp server if you cannot use tftpd-hpa. Modify dnsmasq.conf accordingly 
   sudo service tftpd enable
   sudo service tftpd start
   ```

4. Ensure that your PXE boot clients are configured to boot from the network. Refer to your client's BIOS/UEFI settings for PXE boot options.

5. Boot your PXE clients and follow your chosen OS installation process.

## License

This repository is provided under the [BSD 2-Clause](LICENSE).  Specifically, the downloader script, the documentation, and the `autoexec.ipxe` file. 

Please note that the iPXE and Netboot.xyz binaries are subject to their respective GPL licenses. 

To avoid GPL violations, the `download-ipxe-netboot.sh` script is provided to fetch these binaries directly from their official sources, or proivde your own substitutions.

Please review the licenses of iPXE and Netboot.xyz before using this repository in production environments.


