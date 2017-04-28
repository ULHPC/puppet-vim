# File::      <tt>vim.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: vim
#
# Configure and manage vim
# This class is meant to be included by the 'generic' module and therefore
# applied to all nodes
#
# = Parameter
#
# $ensure:: (*Default*: 'present' ) Valid values are present or absent to
# specify whether or not vim should be installed
#
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     include vim
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class vim($ensure = $vim::params::ensure) inherits vim::params
{
    info("Configuring vim (ensure = ${ensure})")

    case $::operatingsystem {
        debian, ubuntu:         { include vim::common::debian }
        redhat, fedora, centos: { include vim::common::redhat }
        default: {
            fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }
}
