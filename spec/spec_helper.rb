require 'rubygems'
require 'mocha'
require 'spec'
require 'rake'
$LOAD_PATH.unshift(File.dirname(__FILE__), "..", "lib")
require 'tlb'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

def tmp_file file_name
  path = File.join(Dir.tmpdir, file_name)
  file = File.new(path, 'w')
  File.truncate path, 0
  file.close
  file
end
