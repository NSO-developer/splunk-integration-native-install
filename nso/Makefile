SUBDIRS := $(wildcard ncs-run/packages/*/src/.)
SHELL := /bin/bash
FILENAME := $(shell sh curr.sh)


deps:
	python3 -m pip install --upgrade pip
	python3 -m pip install --upgrade setuptools
	#sudo apt-get install libpq-dev python3.11-dev python3.11-distutils libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libjpeg-dev zlib1g-dev
	python3 -m pip install -r packages/observability-exporter/src/requirements.txt
	#sudo apt-get install python3.11-dev python3.11-distutils 
	#sudo apt-get install collectd

build: 
	ncs-setup --dest ncs-run --generate-ssh-keys
	rm -rf ncs-run/packages
	cd ncs-run; ln -s ../packages
	cp -R ncs-cdb ncs-run/
	alias python="python3.11";alias python3="python3.11"; make make_packages

build_nocompile: 
	ncs-setup --dest ncs-run --package packages/* --generate-ssh-keys
	cp -R ncs-cdb ncs-run/

clean_logs:
	rm -rf ncs_run/logs/*

clean_cdb:
	rm -rf ncs_run/ncs-cdb/*


clean:
	rm -rf lux_logs
	rm -rf ncs-run

reset: clean
	rm -rf packages/*
	rm -rf ncs-cdb/*
	rm -f test.lux
	cp lux_template/test.lux test.lux
	rm -f Tail-f-env/nso/download/*.bin
	rm -rf Tail-f-env/nso/nso_store/*
	rm -rf Tail-f-env/example/unzip/nso/*
	rm -rf Tail-f-env/example/unzip/confd/*



start:
	cd ncs-run;ncs --stop; ncs 

stop:
	cd ncs-run; ncs --stop 

cli-c:
	cd ncs-run; ncs_cli -C -u admin --noaaa ; cd ..


cli-j:
	cd ncs-run ; ncs_cli -J -u admin --noaaa; cd ..

tar: reset
	rm ${FILENAME}.tar.gz
	cd ../; tar -czvf  ${FILENAME}.tar.gz ${FILENAME}; mv  ${FILENAME}.tar.gz  ${FILENAME}/



make_packages: $(SUBDIRS)
$(SUBDIRS):
	export NCS_CONFIG_DIR=$(PWD)/ncs-dir;export NCS_RUN_DIR=$(PWD)/ncs-dir;export NCS_LOG_DIR=$(PWD)/ncs-dir/logs;$(MAKE) clean all -C $@ 


.PHONY: make_packages $(SUBDIRS)

