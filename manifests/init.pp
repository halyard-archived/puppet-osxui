# == Class: osxui
#
# Full description of class osxui here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class osxui (
) {
  include osx::dock::disable
  include osx::dock::autohide
  include osx::dock::disable_dashboard

  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_autocorrect
  include osx::keyboard::capslock_to_control
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate

  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::global::tap_to_click

  include osx::software_update

  include osx::sound::interface_sound_effects

  include osx::finder::unhide_library
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  include osx::finder::empty_trash_securely
  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  class { 'osx::dock::hot_corners':
    top_right => "Start Screen Saver"
  }

  boxen::osx_defaults { 'Set sidebar icon size to small':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSTableViewDefaultSizeMode',
    value  => 1,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Jump to spot that is clicked':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleScrollerPagingBehavior',
    value  => 1,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Use list view in Finder':
    user   => $::boxen_user,
    domain => 'com.apple.Finder',
    key    => 'FXPreferredViewStyle',
    value  => 'Nlsv',
    type   => 'string'
  }

  boxen::osx_defaults { 'Dark mode UI':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    value  => 'Dark',
    type   => 'string'
  }

  boxen::osx_defaults { 'Check for updates daily':
    user   => $::boxen_user,
    domain => 'com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    value  => 1,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Set Finder default path type':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'NewWindowTarget',
    value  => 'PfLo',
    type   => 'string'
  }

  boxen::osx_defaults { 'Set Finder default path':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'NewWindowTargetPath',
    value  => "file:///Users/${::boxen_user}",
    type   => 'string'
  }

  boxen::osx_defaults { 'Prevent Time Machine from prompting to use new hard drives as backup volume':
    user   => $::boxen_user,
    domain => 'com.apple.TimeMachine',
    key    => 'DoNotOfferNewDisksForBackup',
    value  => true,
    type   => 'boolean'
  }

  boxen::osx_defaults { 'Change screensaver start time':
    host   => 'currentHost',
    user   => $::boxen_user,
    domain => 'com.apple.screensaver',
    key    => 'idleTime',
    value  => 300,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Use 24 hour clock with date':
    user   => $::boxen_user,
    domain => 'com.apple.menuextra.clock',
    key    => 'DateFormat',
    value  => 'EEE MMM d  H:mm:ss',
    type   => 'string'
  }

  boxen::osx_defaults { 'Disable Gatekeeper':
    user   => 'root',
    domain => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
    type   => 'string'
  }

  boxen::osx_defaults { 'Enable firewall':
    user   => 'root',
    domain => '/Library/Preferences/com.apple.alf',
    key    => 'globalstate',
    value  => 1,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Dim keyboard after 1 minute of inactivity':
    user   => $::boxen_user,
    domain => 'com.apple.BezelServices',
    key    => 'kDimTime',
    value  => 300,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Crank up trackpad speed':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.scaling',
    value  => 6,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Enable feedback on volume change':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.sound.beep.feedback',
    value  => 1,
    type   => 'integer'
  }
}
