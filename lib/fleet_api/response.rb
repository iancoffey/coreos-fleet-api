class FleetAPI::Response
  attr_reader :headers, :status, :body, :request

  def initialize(options={})
    @status  = options[:status]
    @headers = options[:headers]
    @body    = options[:body]
    @request = options[:request]
  end

  def successful?
    self.status.to_s =~ /(2\d\d|304)/
  end

  def raise!
    if !successful?
      raise((ClientError).new(self))
    else self
    end
  end

  class ClientError < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
      super({
          :body    => response.body,
          :headers => response.headers,
          :request => response.request,
          :status  => response.status,
        }.inspect)
    end
  end
end
