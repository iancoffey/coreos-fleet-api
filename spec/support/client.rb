module ClientHelper
  def create_client(attributes={})
    attributes.merge!(logger: Logger.new(STDOUT)) if ENV['VERBOSE']

    FleetAPI::Client.new(attributes)
  end
end

RSpec.configure do |config|
  config.include(ClientHelper)
end
