class Opp < ActiveRecord::Base
    
    def self.search(query)
        where("title ILIKE ?", "%#{query}%")
    end
end
