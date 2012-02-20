# Class: backup_manager::config
#
# This class manage the backup-manager configuration
class backup_manager::config {
    file {
        "${backup_manager::params::configuration_dir}" :
            ensure => directory,
            owner => root,
            group => root,
            mode => 0755,
            require => Class["backup_manager::install"],
    }
    file {
        "${backup_manager::params::temporary_dir}" :
            ensure => directory,
            owner => root,
            group => root,
            mode => 0755,
            require => Class["backup_manager::install"],
    }
}
