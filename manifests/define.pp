################################################################################
#
#   This define helps to register a backup in the crontab.
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
# == Parameters
#
# [+hour+]
#   
#   The hour at which to run the cron job. Optional; if specified, must be between 0 and 23, inclusive.
#
# [+minute+]
#   
#   The minute at which to run the cron job. Optional; if specified, must be between 0 and 59, inclusive.
#
# [+month+]
#   
#   The month of the year. Optional; if specified must be between 1 and 12 or the month name (e.g., December).
#
# [+monthday+]
#   
#   The day of the month on which to run the command. Optional; if specified, must be between 1 and 31.
#
# [+weekday+]
#   
#   The weekday on which to run the command. Optional; if specified, must be between 0 and 7, inclusive, with 0 (or 7) being Sunday, or must be the name of the day (e.g., Tuesday).
#
# [+special+]
#   
#   A special value such as ÔrebootÕ or ÔannuallyÕ. Only available on supported systems such as Vixie Cron. Overrides more specific time of day/week settings.
#
# [+source+]
#   
#   Source file of the backup-manager configuration file. Valid values are either fully qualified paths to files, or URIs. Currently supported URI types are puppet and file.
#
#
# == Modules Dependencies
#
#
# == Examples
#
#    backup_manager::define { "bck-data-repository.exoplatform.org" :
#        source => "puppet:///modules/exo/etc/backup-manager/${::hostname}/data-repository.exoplatform.org.conf",
#        hour => "0",
#        minute => "0",        
#    }
#
################################################################################
define backup_manager::define ($hour = undef, $minute = undef, $month = undef, $monthday = undef, $weekday = undef, $special = undef, $source) {
    file {
        "/etc/backup-manager/${name}.conf" :
            ensure => file,
            owner => root,
            group => root,
            source => "${source}",
            require => Class['backup_manager::install'],
    } ->
    cron { "${name}" :
        ensure => present,
        command => "/usr/sbin/backup-manager --verbose -c /etc/backup-manager/${name}.conf  > /dev/null 2>&1",
        user => "root",
        hour => $hour,
        minute => $minute,
        month => $month,
        monthday => $monthday,
        weekday => $weekday,
        special => $special,
    }   
}