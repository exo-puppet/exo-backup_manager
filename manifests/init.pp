################################################################################
#
#   This module manages the backup-manager service.
#
#   Tested platforms:
#    - Ubuntu 11.10 Oneiric
#    - Ubuntu 11.04 Natty
#    - Ubuntu 10.04 Lucid
#
#
# == Parameters
#   [+ensure+]
#       (OPTIONAL) (default: present)
#       
#       this variable allows to choose if backup-manager must be present and which version (values : "present", "latest", a version) 
#
# == Modules Dependencies
#
# == Examples
#
#   class { "backup_manager":
#       ensure => "latest",
#   }
#
################################################################################
class backup_manager ( $ensure = present) {

    include backup_manager::params, backup_manager::install, backup_manager::config
}