require 'spec_helper'

### Apache ###

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
#  its(:content) { should match /ServerName default/ }
end

### MySQL ###

describe package('mysql') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_running }
end

describe port(3306) do
  it { should be_listening}
end

describe file('/etc/my.cnf') do
  it { should be_file }
#  its(:content) { should match /ServerName default/ }
end

### Php ###

describe package('php') do
  it { should be_installed }
end