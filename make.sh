#!/bin/bash
# Required Flutter version
REQUIRED_VERSION="3.24.2"

check_fvm_in_command() {
  for arg in $@; do
    if [[ $arg == "-f" ]]; then
      FVM=0
      return
    fi
  done
  FVM=1
  return
}


get_flutter_version() {
  if [[ $FVM -eq 0 ]]; then
    CURRENT_VERSION=$(fvm flutter --version | awk '/Flutter/ {print $2}')
  else
    CURRENT_VERSION=$(flutter --version | awk '/Flutter/ {print $2}')
  fi
}

get_flavor() {
  local flavor_param
  local flavor_value

  for arg in "$@"; do
    if [[ $arg =~ ^--flavor=([^=]+)$ ]]; then
      flavor_value="${BASH_REMATCH[1]}"
      FLAVOR=$flavor_value
      return
    fi
  done
  echo "\033[31mError: No valid --flavor parameter found.\033[0m"
  exit 1
}

generate_files() {
  if [[ $FVM -eq 0 ]]; then
    for arg in $@; do
        if [[ $arg == "-c" ]]; then
            fvm flutter clean
        fi
    done
    fvm flutter pub get
    fvm dart run build_runner build -d
    fvm flutter gen-l10n
    fvm dart run flutter_native_splash:create --flavors $FLAVOR
  else
    for arg in $@; do
        if [[ $arg == "-c" ]]; then
            flutter clean
        fi
    done
    flutter pub get
    dart run build_runner build -d
    flutter gen-l10n
    dart run flutter_native_splash:create --flavors $FLAVOR
  fi
  echo "\033[0;32mFiles generated successfully.\033[0m"
}

run_app() {
  for arg in $@; do
      if [[ $arg == "-r" ]]; then
        if [[ $FVM -eq 0 ]]; then
            fvm flutter run --flavor=$FLAVOR
          else
            flutter run --flavor=$FLAVOR
          fi
        return
      fi
    done
    return
}

display_parameters() {
  echo "\033[0;32m*** Use FVM: $([[ "$FVM" == 0 ]] && echo "true" || echo "false")\033[0m"
  echo "\033[0;32m*** Flutter version: $CURRENT_VERSION\033[0m"
  echo "\033[0;32m*** Flavor: $FLAVOR\033[0m"
}

check_fvm_in_command $@
get_flutter_version
get_flavor $@
generate_files $@
display_parameters
run_app $@

