class FleetAPI::Client
  class Real
    def create_unit(params={})
      request(
        :body   => params,
        :method => 'PUT',
        :path => "v1-alpha/units",
      )
    end
  end

  class Mock
    def create_unit(params={})
      unit = params.delete('unit')
      unit['id'] = FleetAPI::Mock.random_id
      self.data[:units][unit['id']] = unit

      response(
        :body   => {"unit" => unit},
        :status => 200,
      )
    end
  end
end
