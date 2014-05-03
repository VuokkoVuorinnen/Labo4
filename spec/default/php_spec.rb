require 'spec_helper'

### Php ###

describe package('php') do
  it { should be_installed }
end

describe package('php-mysql') do
  it { should be_installed }
end