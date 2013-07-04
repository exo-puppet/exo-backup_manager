# Class: backup_manager::install
#
# This class manage the installation of the backup-manager package
class backup_manager::install {
  case $::operatingsystem {
    /(Ubuntu)/ : {
      package { 'backup-manager':
        ensure => $backup_manager::ensure,
        name   => $backup_manager::params::package_name,
      }
    }
  }
}
