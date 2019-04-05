#/bin/zsh

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
for k v in ${(kv)links}; do 
	LINK=`echo "$HOME/.$k"`
	TARGET=`echo "$HOME/.config/$v"`
	ln -s $TARGET $LINK
done