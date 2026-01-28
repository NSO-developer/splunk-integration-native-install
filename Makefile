all: deps nso

deps: env
	-cd run; git clone https://github.com/open-telemetry/opentelemetry-collector-contrib.git
	./splunk/bin/activate ;cd nso; make deps

env:
	python3.11 -m venv splunk
	chmod 755 splunk/bin/activate
	splunk/bin/activate

nso:
	cd nso; make clean build

stop:
	cd nso; make stop
	cd run; docker compose down
	systemctl stop collectd.service
	systemctl status collectd.service

start:
	cd nso; make start
	cd run; docker compose up -d
	systemctl start collectd.service
	systemctl status collectd.service

start_frontend:
	cd nso; make start
	cd run; docker compose up

clean: stop
	cd nso; make clean
	

reset: clean
	rm -rf cd run/opentelemetry-collector-contrib

.PHONY: nso
