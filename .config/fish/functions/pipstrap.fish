# Defined in - @ line 1
function pipstrap --description 'alias pipstrap=pipenv install --dev --pre black flake8 pynvim mypy pytest'
	pipenv install --dev --pre black flake8 pynvim mypy pytest $argv;
end
