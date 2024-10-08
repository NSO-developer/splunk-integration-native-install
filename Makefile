all: deps nso

deps:
	-cd run; git clone git@github.com:open-telemetry/opentelemetry-collector-contrib.git
	cd nso; make deps

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
