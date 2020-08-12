# Userenv plugin
#
# Ensures any filed called `.env` is sourced when present in the current
# working directory.

load-local-env() {
  if [[ -f .env && -r .env ]]; then
    set -o allexport
    source .env
    set +o allexport
  fi
}

# Source `.env` when the cwd changes.
autoload -U add-zsh-hook
add-zsh-hook chpwd load-local-env

# Source `.env` when the shell starts.
load-local-env
