train:
	rasa train --domain domain.yml --data data --config config.yml --out models

train-nlu:
	rasa train nlu -u data/nlu -c config.yml --out models/nlu

run:
	rasa run actions --actions actions.actions & 
	rasa run --endpoints configs/endpoints.yml --enable-api -m models/20191024-173414.tar.gz -p 8008 --debug

run-nlu:
	rasa run --enable-api -m models/nlu

run-cmdline:
	rasa run actions --actions actions.actions & 
	rasa shell --endpoints configs/endpoints.yml -m models --debug

run-graph:
	rasa visualize --domain domain.yml --stories data/core --config config.yml --nlu data/nlu

run-x:
	rasa run actions --actions actions.actions &
	rasa x -m models --endpoints configs/endpoints.yml