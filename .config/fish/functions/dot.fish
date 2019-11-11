# Defined in - @ line 1
function dot --description 'alias dot=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
	/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end
