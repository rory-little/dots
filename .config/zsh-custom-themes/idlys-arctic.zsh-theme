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

host_info='%B%F{cyan}%n%F{blue}@%m%f%b'
dir_info='%F{cyan}$(get_dir_prefix)%B%1~%b%f'
vc_info='$(git_prompt_info)'

PROMPT="${host_info} ${dir_info}${vc_info} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{cyan}[%B%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%F{cyan}]%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{red}*%f"

