class Entry < ApplicationRecord
    paginates_per 20

    def self.search_by_country(query)
        where("country like ?", "%#{query}%")
    end

    def self.search_by_age(query)
        where("population_group like ?", "%#{query}%")
    end

    def self.search_by_food(query)
        where("food_group like ?", "%#{query}%")
    end

end
