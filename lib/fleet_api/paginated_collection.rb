module FleetAPI::PaginatedCollection
  def self.included(klass)
    klass.attribute :nextPageToken
    klass.send(:extend, FleetAPI::PaginatedCollection::Attributes)
  end

  module FleetAPI::PaginatedCollection::Attributes
    def collection_root(collection_root)
      @collection_root = collection_root
    end

    def collection_request(collection_request)
      @collection_request = collection_request
    end
  end

  def collection_root
    self.class.instance_variable_get(:@collection_root)
  end

  def collection_request
    self.class.instance_variable_get(:@collection_request)
  end

  def next_page
    all("url" => self.next_link) if self.next_link
  end

  def all(params={})
    response = connection.send(self.collection_request, params)

    collection = self.clone.load(response.body[self.collection_root])

    collection
  end
end
