log() {
  local nc='\e[0m'
  local red='\e[31m'
  local green='\e[0;32m'
  local yellow='\e[0;33m'
  local log_timestamp
  log_timestamp=$(date +"[%Y-%m-%dT%H:%M:%S]")

  case "${1,,}" in
  info)
    echo "${log_timestamp} [INFO] -- ${2}..."
    ;;
  success)
    echo -e "${log_timestamp} [${green}SUCCESS${nc}] -- ${2}!"
    ;;
  warning)
    echo -e "${log_timestamp} [${yellow}WARNING${nc}] -- ${2}!"
    ;;
  error)
    echo -e "${log_timestamp} [${red}ERROR${nc}] -- ${2}!"
    ;;
  banner)
    if command -v figlet &>/dev/null; then
      figlet "${2}"
    else
      echo "[BANNER] -- ${2}"
    fi
    ;;
  *)
    echo -e "${log_timestamp} [UNKNOWN] -- INVALID LOG TYPE ${1}..."
    exit 1
    ;;
  esac
}
readonly -f log

notify() {
  case "${1,,}" in
  system)
    notify-send -t 3000 "${2}"
    ;;
  *)
    log error "Invalid notification type ${1}"
    ;;
  esac
}
readonly -f notify

handle_log() {
  local -r log_path="${1:-/var/log/$(basename "${0}")}"
  exec &>> >(tee -a "${log_path}")
}
readonly -f handle_log

error_trap() {
  log error "An error occured on line ${1}: '${BASH_COMMAND}' exited with status code ${?}"
}
readonly -f error_trap

handle_errors() {
  trap 'error_trap $LINENO' ERR
}
readonly -f handle_errors

handle_root() {
  if [ "${EUID}" != 0 ]; then
    log error "This script must be run as root"
    exit 1
  fi
}
readonly -f handle_root

handle_environment() {
  for env_var in "${@}"; do
    if [ -z "${!env_var:-}" ]; then
      log error "Missing required environment variable ${env_var}"
      exit 1
    fi
  done
}
readonly -f handle_environment
