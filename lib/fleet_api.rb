require 'addressable/uri'
require 'cistern'
require 'json'
require 'faraday'
require 'faraday_middleware'
require 'logger'
require 'securerandom'

require 'fleet_api/version'

module FleetAPI
  autoload :Client, 'fleet_api/client'
  autoload :Collection, 'fleet_api/collection'
  autoload :PaginatedCollection, 'fleet_api/paginated_collection'
  autoload :Model, 'fleet_api/attributes'
  autoload :Response, 'fleet_api/response'
  autoload :Json, "fleet_api/json"
  autoload :Mock, "fleet_api/mock"
  autoload :Model, "fleet_api/model"

# TODO: handle the weirdo paging
end
