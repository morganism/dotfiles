## Amazon Q pre block. Keep at the top of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"
source /Users/morgan/.javarc

set -o vi
alias ll='ls -lrt'
# Mimic Linux 'ip' command on macOS
alias ip='ifconfig'                       # `ip a` → network interfaces
alias ipa='ifconfig'                      # shorthand for `ip a`
alias ipr='netstat -nr'                   # `ip r` → routing table
alias ipn='networksetup -listallhardwareports'  # shows interface names and MACs


# Added by `rbenv init` on Sat  9 Aug 2025 22:43:51 BST
eval "$(rbenv init - --no-rehash bash)"


export PATH="$HOME/.bin:$HOME/bin:/usr/local/Cellar/ruby/3.4.5/bin:$PATH"
source $HOME/.bin/.functions

export CFLAGS="-arch x86_64"
export LDFLAGS="-arch x86_64"

export OPENAI_ORGANIZATION_ID="morganism"

## Amazon Q post block. Keep at the bottom of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"
