# Defined in - @ line 1
function docker-clean-imgs --description 'alias docker-clean-imgs=docker rmi -f (docker images -q)'
	docker rmi -f (docker images -q) $argv;
end
