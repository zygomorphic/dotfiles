HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

export BROWSER="chromium"
export EDITOR="vim"
export PATH="${PATH}:${HOME}/bin:${HOME}/.cabal/bin"
export JAVA_HOME=/usr/local/runtime/java/jdk1.8.0_201
# export JAVA_HOME=/usr/local/runtime/java/jdk-11.0.2
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# 开启颜色
autoload -U colors && colors
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias gpm="git push -u origin master"
alias nvc="optirun chromium"
alias nvv="optirun VirtualBox"
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias ebuild='nocorrect ebuild'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias hpodder='nocorrect hpodder'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias sudo='nocorrect sudo'

setopt correct_all
setopt beep notify
setopt completealiases
setopt HIST_IGNORE_DUPS
bindkey -e

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

#------------------------------------------------------------------------------------------
# 					Plugins
#------------------------------------------------------------------------------------------
# source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#------------------------------------------------------------------------------------------
# 					Plugins End
#------------------------------------------------------------------------------------------

## 启用忽略大小写匹配
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -U compinit promptinit
compinit
promptinit
# prompt off
setopt prompt_subst




## 加载zsh文件
for config_file (~/.dotfiles/zsh/lib/*.zsh); do
  custom_config_file="${ZSH_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done
## 提示符样式设置
PROMPT='%{∛$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}%{$fg_bold[white]%}${_current_dir}%{$reset_color%} $(git_prompt_info)
%{$terminfo[blod]$fg[$CARETCOLOR]%}↬ %{$reset_color%}'
PROMPT2='%{$fg[$CARETCOLOR]%}↫%{$reset_color%} '
RPROMPT='%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
## 相关变量配置
local _current_dir="%3~ "
local _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

function _current_dir() {
  local _max_pwd_length="65"
  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "%-2~ ... %3~ "
  else
    echo "%~ "
  fi
}

function _git_time_since_commit() {
# Only proceed if there is actually a commit.
  if last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null); then
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -ge 24 ]; then
      commit_age="${days}d"
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m"
    else
      commit_age="${minutes}m"
    fi
    color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
    echo "$color$commit_age%{$reset_color%}"
  fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="white"
fi

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export GREP_COLOR='1;33'
export CLICOLOR=1


# urxvt title
precmd() {
    print -Pn "\e]0;%n@%m: %~\a"
}
    
