if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RUBY_PROMPT_="%{$fg_bold[blue]%}r:(%{$fg[green]%}\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg_bold[blue]%})%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_="%{$fg_bold[blue]%}r:(%{$fg[green]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg_bold[blue]%})%{$reset_color%}"
  fi
fi

HOST_PROMPT_="%{$fg_bold[red]%}çαǥεπī✗ %{$fg_bold[cyan]%}%c "
GIT_PROMPT="%{$fg_bold[blue]%}\$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"
PROMPT="$HOST_PROMPT_$RUBY_PROMPT_$GIT_PROMPT"

ZSH_THEME_GIT_PROMPT_PREFIX=" g:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}〄%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
