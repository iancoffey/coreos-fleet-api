class FleetAPI::Model < Cistern::Model
  attr_accessor :errors

  def save!
    raise NotImplementedError
  end
end
