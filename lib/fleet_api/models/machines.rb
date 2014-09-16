class FleetAPI::Client::Machines < Cistern::Collection
  include FleetAPI::Collection
  include FleetAPI::PaginatedCollection

  model FleetAPI::Client::Machine

  model_root "machine"
#  model_request :get_machine
  collection_root "machines"
  collection_request :get_machines
end
