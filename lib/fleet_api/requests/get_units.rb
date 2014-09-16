class FleetAPI::Client
  class Real
    def get_units(params={})
      request(
        :method => 'GET',
        :path   => "v1-alpha/units",
      )
    end
  end

  class Mock
    def get_units(params={})
      units = page(params, :units, "unit")

      response(
        :body    => {"units" => units},
        :status  => 200,
        :headers => {
          "Content-Type" => "application/json; charset=utf8",
        }
      )
    end
  end
end

