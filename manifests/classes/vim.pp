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
        debian, ubuntu:         { include vim::debian }
        redhat, fedora, centos: { include vim::redhat }
        default: {
            fail("Module $module_name is not supported on $operatingsystem")
        }
    }
}

# ------------------------------------------------------------------------------
# = Class: vim::common
#
# Base class to be inherited by the other vim classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class vim::common {

    # Load the variables used in this module. Check the ssh-server-params.pp file
    require vim::params

    package { 'vim':
        name    => "${vim::params::packagename}",
        ensure  => "${vim::ensure}",
    }

    $ensuredir = $vim::ensure ? {
         'absent' => "${vim::ensure}",
         default  => 'directory'
    }

    file { "${vim::params::configdir}":
        ensure  => "${ensuredir}",
        owner   => "${vim::params::configfile_owner}",
        group   => "${vim::params::configfile_group}",
        mode    => "${vim::params::configfile_mode}",
        content => template("vim/vimrc.erb"),
        require => Package['vim'],
    }


    file { "${vim::params::configfile}":
        ensure  => "${vim::ensure}",
        owner   => "${vim::params::configfile_owner}",
        group   => "${vim::params::configfile_group}",
        mode    => "${vim::params::configfile_mode}",
        content => template("vim/vimrc.erb"),
        require => [ Package['vim'], 
                     File["${vim::params::configdir}"] 
                   ]
    }

    # file { "${vim::params::colorsdir}":
    #     ensure => "$ensuredir",
    #     owner  => "${vim::params::configfile_owner}",
    #     group  => "${vim::params::configfile_group}",
    #     mode   => '0755'
    # }

    # file { "${vim::params::colorsdir}/${vim::params::colorthemefile}":
    #     ensure  => "${vim::ensure}",
    #     owner   => "${vim::params::configfile_owner}",
    #     group   => "${vim::params::configfile_group}",
    #     mode    => "${vim::params::configfile_mode}",
    #     source  => "puppet:///modules/vim/${vim::params::colorthemefile}",
    #     require => File[ "${vim::params::colorsdir}" ]
    # }

}


# ------------------------------------------------------------------------------
# = Class: vim::debian
#
# Specialization class for Debian systems
class vim::debian inherits vim::common { }

# ------------------------------------------------------------------------------
# = Class: vim::redhat
#
# Specialization class for Redhat systems
class vim::redhat inherits vim::common { }



