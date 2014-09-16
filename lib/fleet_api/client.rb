class FleetAPI::Client < Cistern::Service
  model_path "fleet_api/models"
  request_path "fleet_api/requests"

  model "unit"
  request "get_unit"
  request "get_units"
  request "create_unit"
  request "destroy_unit"
  collection "units"

  recognizes :logger, :url

  class Real
    attr_reader :url, :path, :connection

    def initialize(options={})
      @url         = URI.parse(options[:url])
      @logger      = Logger.new(nil)
      adapter      = Faraday.default_adapter

      @connection = Faraday.new(:url => url) do |faraday|
        faraday.response :logger
        faraday.response :json
        faraday.request :multipart
        faraday.request :json
        faraday.adapter(*adapter)
      end
    end

    def request(options={})
      method  = (options[:method] || "get").to_s.downcase.to_sym
      url     = Addressable::URI.parse(options[:url] || File.join(@url.to_s, options[:path] || "/"))
      url.query_values = (url.query_values || {}).merge(options[:query] || {})
      params  = options[:params] || {}
      body    = options[:body]
      headers = options[:headers] || {"Accept" => "application/json"}
      headers.merge!("Content-Type" => "application/x-www-form-urlencoded") if !body && !params.empty?

      response = @connection.send(method) do |req|
        req.url(url.to_s)
        req.headers.merge!(headers)
        req.params.merge!(params)
        req.body = body
      end

      FleetAPI::Response.new(
        :status  => response.status,
        :headers => response.headers,
        :body    => response.body,
        :request => {
          :method  => method,
          :url     => url,
          :body    => body,
          :headers => headers,
        }
      ).raise!
    end
  end

  class Mock
    def initialize(options={})
      @url = options[:url] || "http://fleet-api.localhost"
    end

    def self.data
      @data ||= {
        :servers => {},
        :notifications => {},
       }
    end

    def self.reset!
      @data = nil
    end

    def data
      self.class.data
    end

    def response(options={})
      url     = options[:url] || File.join(@url.to_s, options[:path] || "/")
      method  = (options[:method] || :get).to_s.to_sym
      status  = options[:status] || 200
      body    = options[:body]
      headers = {
        "Content-Type" => "application/json; charset=utf-8"
      }.merge(options[:headers] || {})

      FleetAPI::Response.new(
        :status  => status,
        :headers => headers,
        :body    => body,
        :request => {
          :method  => method,
          :url     => url,
          :body    => body,
          :headers => headers,
        }
      ).raise!
    end
  end
end