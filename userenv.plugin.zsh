# Userenv plugin
#
# Ensures any filed called `$USER.env` is sourced when present in the current
# working directory.

load-local-user-env() {
  ENV_FILE="$USER.env"

  if [[ -f $ENV_FILE && -r $ENV_FILE ]]; then
    source $ENV_FILE
  fi
}

# Source `$USER.env` when the cwd changes.
autoload -U add-zsh-hook
add-zsh-hook chpwd load-local-user-env

# Source `$USER.env` when the shell starts.
load-local-user-env
