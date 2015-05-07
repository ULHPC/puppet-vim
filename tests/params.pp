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

include 'ULHPC/vim::params'

$names = ["ensure", "protocol", "port", "packagename"]

notice("ULHPC/vim::params::ensure = ${ULHPC/vim::params::ensure}")
notice("ULHPC/vim::params::protocol = ${ULHPC/vim::params::protocol}")
notice("ULHPC/vim::params::port = ${ULHPC/vim::params::port}")
notice("ULHPC/vim::params::packagename = ${ULHPC/vim::params::packagename}")

#each($names) |$v| {
#    $var = "ULHPC/vim::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
