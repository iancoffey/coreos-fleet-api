class FleetAPI::Client::Unit < FleetAPI::Model
  identity :name

  attribute :machineID
  attribute :currentState
  attribute :desiredState
  attribute :options

  def save
    requires :server_id, :severity, :type

    params = {
      "desiredState" => self.desiredState,
      "options" => self.options
    }

    if new_record?
      request_attributes = connection.create_unit(params).body
    else
      params["name"] = self.name
      self.connection.update_unit(params)
    end
  end
end
