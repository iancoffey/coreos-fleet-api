module FleetAPI::Collection
  def self.included(klass)
    klass.send(:extend, FleetAPI::Collection::Attributes)
  end

  module Attributes
    def model_root(model_root)
      @model_root = model_root
    end

    def model_request(model_request)
      @model_request = model_request
    end
  end

  def model_root
    self.class.instance_variable_get(:@model_root)
  end

  def model_request
    self.class.instance_variable_get(:@model_request)
  end

  def get(id)
    if data = connection.send(self.model_request, {"name" => id}).body[self.model_root] # hax
      new(data)
    else
      nil
    end
  rescue FleetAPI::Response::NotFound
    nil
  end
end
