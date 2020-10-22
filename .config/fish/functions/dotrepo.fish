# Defined in - @ line 1
function dotrepo --wraps='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME' --description 'alias dotrepo=/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME $argv;
end
