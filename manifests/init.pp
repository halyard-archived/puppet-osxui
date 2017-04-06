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

  include osx::keyboard::capslock_to_control
  include osx::keyboard::dim_backlight

  include osx::mouse::trackpad_speed
  include osx::mouse::silent_trackpad
  class { 'osx::mouse::force_touch':
    enabled => false
  }

  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_autocorrect
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::global::disable_smart_quotes
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::scroll_behavior
  include osx::global::ui_mode
  include osx::global::time_machine_prompts
  include osx::global::clock_format
  include osx::global::tap_to_click

  include osx::sound::interface_sound_effects
  include osx::sound::volume_change_feedback

  include osx::finder::unhide_library
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings
  include osx::finder::empty_trash_securely
  include osx::finder::sidebar_icon_size
  include osx::finder::view_style
  include osx::finder::default_path

  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  package { 'hyperspace-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
  -> class { 'osx::screensaver::set':
    screensaver => 'Hyperspace',
    path        => join([
      "/Users/${::boxen_user}/Library/Screen Savers/",
      'Hyperspace.saver'])
  }
  include osx::screensaver::start_delay

  class { 'osx::dock::hot_corners':
    top_right => 'Start Screen Saver'
  }
}
