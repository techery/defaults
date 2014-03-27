config = %Q{
author: %%name%%
company: Techery
configure_git: true
warnings_as_errors: true
enable_static_analyzer: true
indentation_level: 2
use_tabs: false
use_cocoapods: true

run_script_phases:
  - todo.sh: Warn for TODO and FIXME comments

warnings:
  - GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED
  - GCC_WARN_MISSING_PARENTHESES
  - GCC_WARN_ABOUT_RETURN_TYPE
  - GCC_WARN_SIGN_COMPARE
  - GCC_WARN_CHECK_SWITCH_STATEMENTS
  - GCC_WARN_UNUSED_FUNCTION
  - GCC_WARN_UNUSED_LABEL
  - GCC_WARN_UNUSED_VALUE
  - GCC_WARN_UNUSED_VARIABLE
  - GCC_WARN_SHADOW
  - GCC_WARN_64_TO_32_BIT_CONVERSION
  - GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS
  - GCC_WARN_ABOUT_MISSING_NEWLINE
  - GCC_WARN_UNDECLARED_SELECTOR
  - GCC_WARN_TYPECHECK_CALLS_TO_PRINTF
  - CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS
  - CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF

application_target_groups:
  - <%= project_name %>:
    - Code:
      - DataSources:
      - Models:
      - Services:
      - Helpers:
      - Controllers:
      - Views:
      - Other:
        - <%= prefix %>AppDelegate.h
        - <%= prefix %>AppDelegate.m
        - <%= project_name %>-Prefix.pch
        - main.m
    - Resources:
      - <%= project_name %>-Info.plist
      - Images.xcassets

unit_test_target_groups:
  - Specs:
    - Resources:
      - UnitTests-Info.plist
      - UnitTests-Prefix.pch
    - Specs:
    - Fixtures:
}

print "Enter your name: "
name = gets

config = config.gsub("%%name%%", name.strip)


liftoff_path = `which liftoff`

if liftoff_path.empty?
  "Installing liftoff"
  `brew tap Techery/formulae`
  `brew install liftoff`
end

puts "Installing liftoff config"

`echo "#{config}" > ~/.liftoffrc`

puts "done."
