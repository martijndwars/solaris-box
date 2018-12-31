# Solaris Box

This project builds a Vagrant box of Solaris. The code is based on [this](http://www.resilvered.com/2014/02/solaris-vagrant-packer-and-base-box.html) blog post, but the `boot_command` has been updated to work with Solaris 11.4.

## Usage

Download `sol-11_4-vbox.ova` from [Oracle VM Templates](https://www.oracle.com/technetwork/server-storage/solaris11/downloads/vm-templates-2245495.html).

```
packer build -force -only=virtualbox-ovf box.json
```

