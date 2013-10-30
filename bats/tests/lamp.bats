#! /usr/bin/env bats
# vim: ft=sh 
# lamp.bats -- Test suite for a LAMP stack

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
