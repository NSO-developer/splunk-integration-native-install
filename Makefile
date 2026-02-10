all: deps nso

deps: env
	-cd run; git clone https://github.com/open-telemetry/opentelemetry-collector-contrib.git
	./splunk/bin/activate ;cd nso; make deps

collectd:
	cd collectd/; bash install.sh

env:
	python3.11 -m venv splunk
	chmod 755 splunk/bin/activate
	splunk/bin/activate

splunk:
	docker pull splunk/splunk:latest
	cd run; docker compose up -d splunk


nso:
	cd nso; make clean build

stop:
	-cd nso; make stop
	cd run; docker compose down
	-sudo systemctl stop collectd.service
	-sudo systemctl status collectd.service

start:
	cd nso; make start
	cd run; docker compose up -d otel-collector
	-sudo systemctl start collectd.service
	-sudo systemctl status collectd.service

start_frontend:
	cd nso; make start
	cd run; docker compose up

clean: stop
	cd nso; make clean
	

reset: clean
	rm -rf cd run/opentelemetry-collector-contrib

.PHONY: nso collectd splunk
