require 'spec_helper'

describe command('curl http://192.168.56.10/ 2>/dev/null | grep "Welcome to WordPress. This is your first post. Edit or delete it, then start blogging" | wc -l') do
	it { should return_stdout '1' }
end

