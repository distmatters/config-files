#/bin/zsh
# Sammi Kiel

# This script is designed to get my laptop up and running after an operating
# system reinstall. It starts by creating symlinks from the config folder 
# (where this repository is intended to reside) and the user's home folder.
# Once this is completed the script installs plugin managers for common 
# software I use (zsh, tmux, and vim). This is followed 

###############################################################################
#                              CREATE  SYMLINKS                               #
###############################################################################
# This section creates symlinks for various config files from the config folder
# to the home directory

# Create an associative array with the key is the name of the link and the
# value is the item to be linked within the config folder
typeset -A links

# Add elements to the associative array, any future files should be added here
links[zshrc]="zsh/zshrc"
links[vim]="vim"
links[stalonetrayrc]="stalonetray/stalonetrayrc"
links[conkyrc]="conky/conkyrc"
links[tmux.conf]="tmux/tmux.conf"

# Iterate over the elements creating links
# for K in "${!MYMAP[@]}"
for K in "${!links[@]}"; do 
	LINK=`echo "$HOME/.$K"`
	TARGET=`echo "$HOME/.config/${links[$K]}"`
	ln -s $TARGET $LINK
done


###############################################################################
#                              PLUGIN  MANAGERS                               #
###############################################################################
# This sections is to install third party plugin managers, e.g. zplugs

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# TMUX Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


