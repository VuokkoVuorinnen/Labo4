#! /usr/bin/env bats
# vim: ft=sh
# lamp.bats -- Test suite for a LAMP stack

IP=192.168.56.10

# General facts

@test "my IP address should be ${IP}" {
        result="$(facter ipaddress_eth1)"
        [ "$?" -eq 0 ]            # exit status should be 0
        [ "${result}" = "${IP}" ] # the result should be the correct IP address
}

@test "my hostname should be foo.bar.com" {
        result="$(hostname -f)"
        [  "$?" -eq 0 ]                   # exit status should be 0
        [  "${result}" == "foo.bar.com" ] # the result should be the correct hostname
}

# Ports

@test "port 22 should be listening" {
	result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".22"')"
	[ "$?" -eq 0 ]     # exit status should be 0
	[ -n "${result}" ] # output should not be empty
}

@test "port 80 should be listening" {
	result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".80"')"
	[ "$?" -eq 0 ]     # exit status should be 0
	[ -n "${result}" ] # output should not be empty
}

@test "port 443 should be listening" {
        result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".443"')"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "port 3306 should be listening" {
        result="$(netstat -lnt | awk '$6 == "LISTEN" && $4 ~ ".3306"')"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

# Services

@test "service httpd should be running" {
	result="$(sudo service httpd status | grep 'is running')"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "service mysqld should be running" {
        result="$(sudo service mysqld status | grep 'is running')"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "service httpd should start at boot" {
	result="$(chkconfig | grep httpd | grep on)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "service mysqld should start at boot" {
        result="$(chkconfig | grep mysqld | grep on)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

# Packages

@test "package httpd should be installed" {
        result="$(rpm -qa | grep httpd)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "package php-mysql should be installed" {
	result="$(rpm -qa | grep php-mysql)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "package php should be installed" {
	result="$(rpm -qa | grep php)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

@test "package mysql should be installed" {
        result="$(rpm -qa | grep mysql)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "${result}" ] # output should not be empty
}

# Others

HTTPDCONFIG=/etc/httpd/conf/httpd.conf

@test "/etc/httpd/conf/httpd.conf sould be a file with the correct mode" {
        result="$(stat -c %a /etc/httpd/conf/httpd.conf)"
        [ -f $file ]          # it should be a file
        [ "$result" -eq 644 ] # filemode should be 644
}

@test "/etc/httpd/conf/httpd.conf should contain the correct servername" {
        result="$(cat /etc/httpd/conf/httpd.conf | grep 'ServerName "foo.bar.com"')"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ -n "$result" ]   # output should not be empty
}

@test "HTTP request should return 200 OK" {
        result="$(curl -s -o /dev/null -w "%{http_code}" https://192.168.56.10/ -k)"
        [ "$?" -eq 0 ]       # exit status should be 0
        [ "$result" -eq 200 ] # http response code should be 200
}

@test "SSL certificate should be correct" {
        result="$(yes 18 | openssl s_client -connect localhost:443 2> /dev/null | grep issuer | grep HoGent)"
        [ "$?" -eq 0 ]     # exit status should be 0
        [ "$result" == "issuer=/C=BE/ST=Oost-Vlaanderen/L=Gent/O=HoGent/OU=TIN/CN=foo.bar.com/emailAddress=admin@bar.com" ]
}

@test "/etc/my.conf should be a file and have the correct mode" {
        result="$(stat -c %a /etc/my.cnf)"
        [ -f $file ]          # it should be a file
        [ "$result" -eq 644 ] # filemode should be 644
}