class FleetAPI::Client::Units < Cistern::Collection
  include FleetAPI::Collection
  include FleetAPI::PaginatedCollection

  model FleetAPI::Client::Unit

  model_root "unit"
  model_request :get_unit
  collection_root "units"
  collection_request :get_units
end
