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

git_state_info() {
  local stat_output

  stat_output=$(git status 2> /dev/null)

  case "$stat_output" in
    *"bisecting"*)
      printf "bisect"
      ;;
    *"Revert"*|*"reverting"*)
      printf "revert"
      ;;
    *"Cherry-pick"*|*"cherry-picking"*)
      printf "cherry-pick"
      ;;
    *"rebas"*)
      printf "rebase"
      ;;
    *"middle of an am"*)
      printf "am"
      ;;
    *"unmerged"*|*"still merging"*)
      printf "merge"
      ;;
  esac
}

do_git_state() {
  local info
  info=$(git_state_info)
  if [[ -n $info ]]; then
    printf " ($info)"
  fi
}

host_info='%B%F{yellow}%n%F{red}@%m%f%b'
dir_info='%F{yellow}$(get_dir_prefix)%B%1~%b%f'
vc_info='$(git_prompt_info)%F{yellow}$(do_git_state)%f'

PROMPT="${host_info} ${dir_info}${vc_info} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{yellow}[%B%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%F{yellow}]%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{red}*%f"

