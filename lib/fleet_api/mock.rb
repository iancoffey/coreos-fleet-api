module FleetAPI
  class Mock
    def self.uuid
      SecureRandom.uuid
    end

    def self.random_id
      existing_ids = []

      while true do
        id = SecureRandom.random_number(1000)
        unless existing_ids.include?(id)
          existing_ids << id
          return id
        end
      end
    end
  end
end
