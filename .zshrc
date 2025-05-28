# Enable vi mode for command line editing
bindkey -v

bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

get_dir_prefix() {
  # Get wd
  dirs=${PWD//#${HOME}/\~}

  dirs=${dirs:h}

  # Split the path into an array of directories
  dirs=("${(@s:/:)dirs}")

  # Iterate over the directories and replace their names with the first letters
  for i in {1..$#dirs}; do
    dirs[$i]=${dirs[$i][1]}
  done

  # Join the modified directories back into a path
  new_path="${(j:/:)dirs}"

  # Output the new path
  [[ "${new_path}" != "." ]] && [[ "${new_path}" != "/" ]] && echo ${new_path}/
}

setopt PROMPT_SUBST

host_info='%B%F{green}%n%F{blue}@%m%f%b'
dir_info='%F{green}$(get_dir_prefix)%B%1~%b%f'
# vc_info='$(git_prompt_info)'
PROMPT="${host_info} ${dir_info} "

[[ -f $HOME/.local_aliases ]] && source $HOME/.local_aliases

rm_macos_fix () {
  rm $@[-1] $@[1,-2]
}


# Hack because of annoying macos arg order
alias rm=rm_macos_fix

# For dotfiles bare repo - this annoying doesn't work with git completions
alias dots="git --git-dir=$HOME/.dots-git --work-tree=$HOME"

export COLORTERM=truecolor

