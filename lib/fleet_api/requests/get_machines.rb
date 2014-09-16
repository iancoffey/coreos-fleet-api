class FleetAPI::Client
  class Real
    def get_machines(params={})
      request(
        :query  => query,
        :method => 'GET',
        :path   => "v1-alpha/machines",
      )
    end
  end

  class Mock
    def get_machines(params={})
      units = self.data['machines']

      response(
        :body    => {"machines" => machines},
        :status  => 200,
        :headers => {
          "Content-Type" => "application/json; charset=utf8",
        }
      )
    end
  end
end

