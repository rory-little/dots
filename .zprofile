source $HOME/.profile

# opam - ocaml package manager - configuration
[[ ! -r /home/rory/.opam/opam-init/init.zsh ]] || source /home/rory/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Bins from idris-pack
[[ -d $HOME/.pack/bin ]] && PATH="$HOME/.pack/bin:$HOME/.idris2/bin:$PATH"
