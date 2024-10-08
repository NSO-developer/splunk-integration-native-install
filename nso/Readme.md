# Reproduction Framework v3.0 - Lux Edition
 
## Usage

Spawn running directory and compile the packages towards current version
```
make build
```
Spawn running directory without compile the packages
```
make build_nocompile
```
Clean and delete spawned running directory 
```
make clean
```
Delete the log file in the running directory
```
make clean_logs
```
Delete the cdb in the ncs-cdb folder
```
make clean_cdb
```
Reset the reproduction framework to the initial state and delete everything(USE WITH CAUTION!!)
```
make reset
```
Start NSO
```
make start
```
Stop NSO
```
make stop
```
Start C CLI
```
make cli-c
```
Start J CLI
```
make cli-j
```

Compile all packages
```
make make_packages
```
