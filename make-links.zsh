# /bin/zsh

# List of things which need to be linked
typeset -A links
links[zshrc]="zsh/zshrc"
links[vim]="vim"
links[stalonetrayrc]="stalonetrayrc"
links[conkyrc]="conky/conkyrc"
for key val in ${(kv)links}; do
	ln -s $HOME/.config/$val $HOME/.$KEY
done