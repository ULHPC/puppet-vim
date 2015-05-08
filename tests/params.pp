# File::      <tt>params.pp</tt>
# Author::    ULHPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2015 ULHPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'vim::params'

$names = ['ensure', 'packagename', 'configdir', 'configfile', 'configfile_mode', 'configfile_owner', 'configfile_group']

notice("vim::params::ensure = ${vim::params::ensure}")
notice("vim::params::packagename = ${vim::params::packagename}")
notice("vim::params::configdir = ${vim::params::configdir}")
notice("vim::params::configfile = ${vim::params::configfile}")
notice("vim::params::configfile_mode = ${vim::params::configfile_mode}")
notice("vim::params::configfile_owner = ${vim::params::configfile_owner}")
notice("vim::params::configfile_group = ${vim::params::configfile_group}")

#each($names) |$v| {
#    $var = "vim::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
