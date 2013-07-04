# Class: backup_manager::params
#
# This class manage the backup-manager parameters for different OS
class backup_manager::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/ : {
      $package_name      = [
        'backup-manager']
      $configuration_dir = '/etc/backup-manager'
      $temporary_dir     = '/tmp/backup-manager'
    }
    default           : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}
