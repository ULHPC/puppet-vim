# File::      <tt>vim.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
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
        ensure => $vim::ensure,
        name   => $vim::params::packagename,
    }

    $ensuredir = $vim::ensure ? {
        'absent' => $vim::ensure,
        default  => 'directory'
    }

    file { $vim::params::configdir:
        ensure  => $ensuredir,
        owner   => $vim::params::configfile_owner,
        group   => $vim::params::configfile_group,
        mode    => $vim::params::configfile_mode,
        content => template('vim/vimrc.erb'),
        require => Package['vim'],
    }


    file { $vim::params::configfile:
        ensure  => $vim::ensure,
        owner   => $vim::params::configfile_owner,
        group   => $vim::params::configfile_group,
        mode    => $vim::params::configfile_mode,
        content => template('vim/vimrc.erb'),
        require =>  [ Package['vim'],
                      File[$vim::params::configdir]
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


