module UnitHelper
  def create_unit(opts={})
    opts['name'] ||= FleetAPI::Mock.random_name
    client.units.create(opts)['unit']
  end
end

RSpec.configure do |config|
  config.include(UnitHelper)
end
