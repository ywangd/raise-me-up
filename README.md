# Raise Me Up - bootstrap a new development machine

**NOTE**: currently only works for Ubuntu 18.04

## Get Started

1. Clone the repository
2. Inside the project, run `./up.sh`


## Test with Vagrant
**NOTE**: recent version of Vagrant is required to supprot the new
`config.vagrant` setting. Tested with v2.2.5

* Run `vagrant up`
* To test changes, run `vagrant provision`
* Controll verbosity with `export ANSIBLE_VERBOSITY=N` where `N` can be from `0` to `3`.
