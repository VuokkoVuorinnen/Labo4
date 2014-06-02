Vagrant puppet lampstack
=====

CentOS via Vagrant + Puppet Lamp stack + Simple wordpress installation

Usage:

	$ git pull git@github.com:VuokkoVuorinnen/vagrant-puppet-lampstack.git
	$ cd vagrant-puppet-lampstack
	$ git submodule update --init --recursive

Then initialize the vagrant box

	$ vagrant up

Note that the BATS tests are run automatically. The ServerSpec tests have to be run by issuing the following command:

	$ rake spec

BATS tests can be run by sshing into the machine and running the tests:

	$ vagrant ssh
	[vagrant@foo ~]$ bats tests/lamp.bats

The Wordpress website provided by this vagrantbox is visible on:

	http://192.168.56.10/
	https://192.168.56.10/

Destroying the environment:

	$ vagrant destroy -f
	$ cd ..
	$ rm -rf vagrant-puppet-lampstack

The template and original assigment were made by Bert Van Vreckem, for the Linux System Administration course taught at HoGent.