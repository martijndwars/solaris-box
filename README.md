# Solaris Box

This project builds a Vagrant box of Solaris. The code is based on [this](http://www.resilvered.com/2014/02/solaris-vagrant-packer-and-base-box.html) blog post, but the `boot_command` has been updated to work with Solaris 11.4. If you don't want to build the box yourself, you can grab the pre-built version from [Vagrant Cloud](https://app.vagrantup.com/MartijnDwars/boxes/solaris11_4).

## Building

Download `sol-11_4-vbox.ova` from [Oracle VM Templates](https://www.oracle.com/technetwork/server-storage/solaris11/downloads/vm-templates-2245495.html). To build the box:

```
packer build -force -only=virtualbox-ovf box.json
```

To register the box with your local Vagrant installation:

```
vagrant box add build/solaris11.box --name solaris11
```

To upload the box to Vagrant Cloud:

```
vagrant cloud publish MartijnDwars/solaris11_4 1.0.0 virtualbox build/solaris11.box
```

## Usage

Run `vagrant init solaris11` or manually create a `Vagrantfile` containing:

```
Vagrant.configure("2") do |config|
  config.vm.box = "solaris11"
end
```

## Internals

### VirtualBox Guest Additions

The image comes with Guest Additions version 5.1.38.

### Users

| Username | Password | Root? |
| -------- | -------- | ----- |
| vagrant123 | vagrant123 | yes |
| vagrant | 1vagrant | no |

The `vagrant` user has passwordless sudo functionality, which is required for the provisioners.

### Keys

The default (insecure) vagrant key is installed for the vagrant user.
