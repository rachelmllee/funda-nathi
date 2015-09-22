class Opp < ActiveRecord::Base

    def self.search(query)
        where("title LIKE ?", "%#{query}%")
    end
end
