alias ll='ls -lGa'
alias ls='ls -G'
alias workoff='deactivate'
alias vim='nvim'
alias cf='aws cloudformation'

export PATH="~/.pyenv:/bin:/usr/local/sbin:$PATH:~/bin:$HOME/.cdk/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PROMPT_COMMAND='history -a'


# Pyenv init
[ $(command -v pyenv) ] && eval "$(pyenv init -)" && [ $(command -v pyenv-virtualenvwrapper_lazy) ] && pyenv virtualenvwrapper_lazy

# AWS ci completion
[ -f '/usr/local/bin/aws_completer' ] && complete -C '/usr/local/bin/aws_completer' aws

# BASH Completion with brew
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Find...
ff () { find . -name "$@" ; }      # ... under current directory ...
ffs () { find . -name "$@"'*' ; }  # ... files starting with ...
ffe () { find . -name '*'"$@" ; }  # ... files ending with ...
