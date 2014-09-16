Bundler.require(:test)
Bundler.require(:darwin) if RUBY_PLATFORM.match(/darwin/)
require File.expand_path("../../lib/fleet_api", __FILE__)
Dir[File.expand_path("../{shared,support}/*.rb", __FILE__)].each{|f| require(f)}

FleetAPI::Client.mock!

FleetAPI::Client::Mock.timeout       = 0
FleetAPI::Client::Mock.poll_interval = 0
FleetAPI::Client::Real.timeout       = 10

RSpec.configure do |config|
  config.order = :random

  config.before(:each) do
    FleetAPI::Client.mocking? ? FleetAPI::Client.reset! : client.reset!
  end
end

