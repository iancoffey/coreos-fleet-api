class FleetAPI::Client
  class Real
    def update_unit(params={})
      name  = params["name"]
      request(
        :body   => params,
        :method => 'PUT',
        :path => "v1-alpha/units/#{name}",
      )
    end
  end

  class Mock
    def update_unit(params={})
      name = params['name']

      unit = self.data[:units][name]
      unless unit
        response(
          :body   => {"error" => "Couldn't find Unit with name #{name}"},
          :status => 404,
        )
      end

      update = params.delete("unit") || {}

      updated_unit = unit.merge(update)

      self.data[:units][unit['name']] = updated_unit

      response(
        :body   => {"unit" => updated_unit},
        :status => 204,
      )
    end
  end
end
