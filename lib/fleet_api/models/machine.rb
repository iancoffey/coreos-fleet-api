class FleetAPI::Client::Machine < FleetAPI::Model
  identity :name

  attribute :id
  attribute :primaryIP
end
