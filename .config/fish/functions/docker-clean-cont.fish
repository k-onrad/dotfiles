# Defined in - @ line 1
function docker-clean-cont --description 'alias docker-clean-cont=docker rm (docker ps -a -q)'
	docker rm (docker ps -a -q) $argv;
end
