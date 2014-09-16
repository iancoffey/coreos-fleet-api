class FleetAPI::Client
  class Real
    def destroy_unit(params={})
      name = params["name"]

      request(
        :path => "v1-alpha/units/#{name}",
        :method   => 'DELETE',
      )
    end
  end
end # TODO: need some mock action
