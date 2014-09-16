class FleetAPI::Client
  class Real
    def get_unit(params={})
      name  = params["name"]
      url = params["url"]

      request(
        :path => "v1-alpha/units/#{name}",
        :url  => url,
      )
    end
  end

  class Mock
    def get_unit(params={})
      name = params['name']

      if unit = self.data[:units][name]
        response(
          :body   => {'unit' => unit},
          :status => 200,
        )
      else
        response(
          :body   => {"error" => "Couldn't find unit with name #{name}"},
          :status => 404,
        )
      end
    end
  end
end
