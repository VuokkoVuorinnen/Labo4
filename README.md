Labo4
=====

CentOS via Vagrant + Puppet Lamp stack + Simple wordpress installation

Usage:

	$ git pull git@github.com:VuokkoVuorinnen/Labo4.git
	$ cd Labo4
	$ git submodule update --init

Then initialize the vagrant box

	$ vagrant up

Note that the BATS tests are run automatically. The ServerSpec tests have to be run by issues the following command:

	$ rake spec

The Wordpress website provided by this vagrantbox is visible on:

	http://192.168.56.10/
	https://192.168.56.10/

TODO List:

* Implement Cucumber tests
* Enhance the ServerSpec and BATS tests
* Run it through puppet-lint
* Update the WordPress instance, or see if we can automate the download