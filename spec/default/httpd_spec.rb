require 'spec_helper'

### Apache ###

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  it { should be_mode 644 }
  its(:content) { should match /ServerName "foo.bar.com"/ }
end

describe command('curl -s -o /dev/null -w "%{http_code}" http://192.168.56.10/') do
  it { should return_stdout '200' }
end

# here we pass the "-k" option to the curl command because otherwise we get some SSL verification errors
describe command('curl -s -o /dev/null -w "%{http_code}" https://192.168.56.10/ -k') do
  it { should return_stdout '200' }
end

# because we're dealing with a self signed certificate
describe command('yes 18 | openssl s_client -connect localhost:443 2> /dev/null | grep issuer | grep HoGent') do
  it { should return_stdout 'issuer=/C=BE/ST=Oost-Vlaanderen/L=Gent/O=HoGent/OU=TIN/CN=foo.bar.com/emailAddress=admin@bar.com' }
end