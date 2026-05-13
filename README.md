# Vim Puppet Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/vim.svg)](https://forge.puppetlabs.com/ULHPC/vim)
[![License](http://img.shields.io/:license-gpl3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Configure and manage vim

      Copyright (c) 2026 ULHPC Team <hpc-sysadmins@uni.lu>


| [Online Project Page](https://github.com/ULHPC/puppet-vim) | [Sources](https://github.com/ULHPC/puppet-vim) | [Issues](https://github.com/ULHPC/puppet-vim/issues) |

## Synopsis

Configure and manage vim
This module implements the following elements:

* __classes__: `vim`

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

## General Parameters

See [manifests/params.pp](manifests/params.pp)

## Overview and Usage

### class `vim`

     include 'vim'

## Librarian-Puppet / R10K Setup

You can of course configure the vim module in your `Puppetfile` to make it
available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/vim"

or, if you prefer to work on the git version:

     mod "ULHPC/vim",
         :git => https://github.com/ULHPC/vim,
         :ref => main

## Developments / Issues / Contributing to the code

This Puppet Module has been implemented in the context of the [UL HPC](http://hpc.uni.lu) Platform of the [University of Luxembourg](http://www.uni.lu).
It relies on [Vox Pupuli modulesync](https://github.com/voxpupuli/modulesync) for its organization.

You can submit bug / issues / feature requests using the
[ULHPC/vim Puppet Module Tracker](https://github.com/ULHPC/vim/issues).
You are more than welcome to contribute to its development by
[sending a pull request](https://help.github.com/articles/using-pull-requests).

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.

[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
