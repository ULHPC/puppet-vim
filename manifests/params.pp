# File::      <tt>vim-params.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# Time-stamp: <Wed 2011-08-31 16:34 svarrette>
# ------------------------------------------------------------------------------
# = Class: vim::params
#
# In this class are defined as variables values that are used in other
# vim classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# The usage of a dedicated param classe is advised to better deal with
# parametrized classes, see
# http://docs.puppetlabs.com/guides/parameterized_classes.html
#
# [Remember: No empty lines between comments and class definition]
#
class vim::params {

    $ensure ='present'

    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################
    $packagename = $::operatingsystem ? {
        redhat  => 'vim-enhanced',
        centos  => 'vim-enhanced',
        default => 'vim',
    }

    $configdir  = $::operatingsystem ? {
        default => '/etc/vim/',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/vim/vimrc',
    }

    # # This directory is meant to hold color themes for vim
    # $colorsdir = $::operatingsystem ? {
    #     default => '/etc/vim/colors',
    # }
    # # The chosen color theme (in files)
    # $colorthemefile = $::operatingsystem ? {
    #     default => 'solarized.vim',
    # }

    $configfile_mode = $::operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }

}
