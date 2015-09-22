class Opp < ActiveRecord::Base
    
<<<<<<< HEAD
   
=======
    def self.search(query)
        where("title ILIKE ?", "%#{query}%")
    end
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
end
