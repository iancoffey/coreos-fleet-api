class FleetAPI::Client
  class Real
    def create_unit(params={})
      name = params["name"]

      request(
        :body   => params,
        :method => 'PUT',
        :path => "v1-alpha/units/#{name}",
      )
    end
  end

  class Mock
    def create_unit(params={})
      params['machineID'] = FleetAPI::Mock.random_id

      self.data[:units][params['name']] = params

      response(
        :body   => {"unit" => self.data[:units][params['name']]},
        :status => 200,
      )
    end
  end
end
