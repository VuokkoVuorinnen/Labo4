require 'spec_helper'

# 2 different methods of handling output: filter it yourself, or let serverspec do it

describe command('curl http://192.168.56.10/ 2>/dev/null | grep "Welcome to WordPress. This is your first post. Edit or delete it, then start blogging" | wc -l') do
	it { should return_stdout '1' }
	it { should return_exit_status 0 }
end

describe command('curl -k  https://192.168.56.10/ 2>/dev/null') do
	its(:stdout) { should match /Welcome to WordPress. This is your first post. Edit or delete it, then start blogging/ }
	it { should return_exit_status 0 }
end
