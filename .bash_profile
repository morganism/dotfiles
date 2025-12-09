## Amazon Q pre block. Keep at the top of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"
## Amazon Q pre block. Keep at the top of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"
source /Users/morgan/.javarc

set -o vi
. ~/.my_aliases
. ~/.aws_aliases





# Added by `rbenv init` on Sat  9 Aug 2025 22:43:51 BST
eval "$(rbenv init - --no-rehash bash)"


source $HOME/.bin/.functions

export CFLAGS="-arch x86_64"
export LDFLAGS="-arch x86_64"

export OPENAI_ORGANIZATION_ID="morganism"

# Amazon Q post block. Keep at the bottom of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"




##EXPOrt AWS_START_URL='https://oidc.eu-west-2.amazonaws.com/authorize?response_type=code&client_id=VHmgfZjJSEFJJ9w6QaVzO2V1LXdlc3QtMg&redirect_uri=http%3A%2F%2F127.0.0.1%3A62164%2Foauth%2Fcallback&state=badb4f45-0a9b-4b46-9f83-0e9d0b0da77c&code_challenge_method=S256&scopes=sso%3Aaccount%3Aaccess&code_challenge=xWeZ0riqYNwfDcf0TEbg4l_OPsIGPGtlzVlJhPt3qgE'

export AWS_START_URL="https://d-9c6758cfc4.awsapps.com/start/#"
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# DIRHOOK         vvvvvvv
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# Config
#_DIRHOOK_NAME=".dirhook"
## set to 1 to allow automatic exec/source (not recommended)
## export DIRHOOK_ALLOW=1

#_dirhook_secure_check() {
#  local file="$1"
#  # must be regular file
#  [[ -f "$file" ]] || return 1
#  # owned by current user
#  [[ "$(stat -c %u "$file" 2>/dev/null)" -eq "$(id -u)" ]] || return 1
#  # not writable by group/other (mode <= 0644)
#  local mode
#  mode=$(stat -c %a "$file" 2>/dev/null)
#  # deny if group/other write bit is set
#  (( (mode & 020) == 0 && (mode & 002) == 0 )) || return 1
#  return 0
#}

#_dirhook_parse_and_act() {
#  local hook="$1"
#  local allow="${DIRHOOK_ALLOW:-0}"
#  # read key/value lines
#  while IFS='=' read -r key val; do
#    # skip blank or comment
#    [[ -z "$key" || "${key:0:1}" = "#" ]] && continue
#    key=$(echo "$key" | tr -d '[:space:]')
#    val=$(echo "$val" | sed 's/^ *//;s/ *$//')
#    case "$key" in
#      message)
#        echo -e "$val"
#        ;;
#      notify)
#        if [[ "$val" -ne 0 ]]; then
#          if [[ "$OSTYPE" == "darwin"* ]]; then
#            osascript -e "display notification \"${val:-Entered directory}\" with title \"Directory\""
#          else
#            command -v notify-send >/dev/null && notify-send "Directory" "$val"
#          fi
#        fi
#        ;;
#      flags)
#        # export a variable the observer can read
#        export DIRHOOK_FLAGS="$val"
#        ;;
#      exec)
#        if [[ "$allow" -ne 1 ]]; then
#          echo "Notice: exec present in $hook but DIRHOOK_ALLOW not set; skipping."
#        else
#          if _dirhook_secure_check "$hook"; then
#            # resolve path relative to directory
#            local script
#            script="$(realpath -m "$val")"
#            [[ -x "$script" ]] || chmod +x "$script" 2>/dev/null
#            # execute in subshell
#            ( cd "$(dirname "$script")" && "$script" ) || echo "Exec failed: $script"
#          else
#            echo "Unsafe hook file, refusing to exec."
#          fi
#        fi
#        ;;
#      source)
#        if [[ "$allow" -ne 1 ]]; then
#          echo "Notice: source present in $hook but DIRHOOK_ALLOW not set; skipping."
#        else
#          if _dirhook_secure_check "$hook"; then
#            # source the referenced file (be cautious — this runs in your current shell)
#            # resolve relative
#            local src
#            src="$(realpath -m "$val")"
#            [[ -f "$src" ]] && source "$src"
#          else
#            echo "Unsafe hook file, refusing to source."
#          fi
#        fi
#        ;;
#    esac
#  done < "$hook"
#}

## override cd; also handle pushd/popd by calling builtin
#cd() {
#  builtin cd "$@" || return
#  local hookfile="$PWD/$_DIRHOOK_NAME"
#  if [[ -f "$hookfile" ]]; then
#    _dirhook_parse_and_act "$hookfile"
#  fi
#}
## optionally handle pushd/popd
#pushd() { builtin pushd "$@" || return; local hookfile="$PWD/$_DIRHOOK_NAME"; [[ -f "$hookfile" ]] && _dirhook_parse_and_act "$hookfile"; }
#popd()  { builtin popd  "$@" || return; local hookfile="$PWD/$_DIRHOOK_NAME"; [[ -f "$hookfile" ]] && _dirhook_parse_and_act "$hookfile"; }

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# DIRHOOK     ^^^^^^^^^
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

source ~/.my_functions
source ~/.my_aliaseS


# Amazon Q post block. Keep at the bottom of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-Q/SHEll/bash_profile.post.bash"

export PATH="/usr/local/Cellar/ruby/3.4.7/bin/:$HOME/.bin:$HOME/bin:/usr/local/bin:$PATH"
source /Users/morgan/src/erichs/composure/composure.sh
export PS1='\[\]\H:\W \u\$ \[\]\[\]'
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.14
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/Homebrew/Library/Homebrew/vendor/portable-ruby/3.4.7/include/ruby-3.4.7/ruby/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.14/bin:/Users/morgan/.local/bin:${PATH}"
export PATH

# Dirhook Integration - Auto-generated
if [ -f "/Users/morgan/.config/dirhook/dirhook.sh" ]; then
    source "/Users/morgan/.config/dirhook/dirhook.sh"
fi


if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v neofetch &>/dev/null; then
  neofetch
fi
export LDFLAGS="-L$(brew --prefix tcl-tk)/lib"
export CPPFLAGS="-I$(brew --prefix tcl-tk)/include"
export PKG_CONFIG_PATH="$(brew --prefix tcl-tk)/lib/pkgconfig"


export WEBHOOK_PROXY_URL="https://smee.io/HVuFooTbuQapCIm"


aws_sso_login () {
  local profile=$1
  export AWS_PROFILE=$profile
  export AWS_DEFAULT_PROFILE=$profile
  echo "aws sso login --profile \"$profile\""
  aws sso login --profile "$profile"
}

alias aws-scalpel-login='aws_sso_login scalpel-org-admin'
alias aws-amazon-login='aws_sso_login amazon-org-admin'
alias aws-personal-login='aws_sso_login personal'
alias aws-scalpel-old-prod-admin='aws_sso_login scalpel-old-prod-admin'
alias aws-scalpel-dev-admin='aws_sso_login scalpel-dev-admin'
alias aws-scalpel-ma-prod-admin='aws_sso_login scalpel-ma-prod-admin'
alias aws-scalpel-old-prod-readonly='aws_sso_login scalpel-old-prod-readonly'
alias aws-scalpel-ma-prod-readonly='aws_sso_login scalpel-ma-prod-readonly'

complete -C /usr/local/bin/terraform terraform


#claude
#anthropic-beta: BETA_FEATURE_NAME
#
CLAUDEMOD_OTHERS="2025-01-24"
CLAUDEMOD_OPUS45="2025-11-24"
BETA_FEATURE_NAME="computer-use-2025-11-24"
ANTHROPIC_BETA="anthropic-beta: $BETA_FEATURE_NAME"
