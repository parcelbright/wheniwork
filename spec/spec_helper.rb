require 'bundler/setup'

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'

Dir['./spec/support/*.rb'].each { |f| require f }

require 'wheniwork'

RSpec.configure do |c|
  c.include StubRequest
end
