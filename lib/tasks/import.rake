require 'csv'
namespace :db do

  task :import_csv => :environment do
    CSV.foreach("data.csv", col_sep: ",", :headers => true) do |row|
      Entry.create!(row.to_hash)
    end
  end

  task :import_country => :environment do
    CSV.foreach("data.csv", col_sep: ",", :headers => true) do |row|
      country = Country.find_or_initialize_by(name: row[0])
      country.save!
    end
  end

  task :import_population_group => :environment do
    CSV.foreach("data.csv", col_sep: ",", :headers => true) do |row|
      population_group = PopulationGroup.find_or_initialize_by(name: row[1])
      population_group.save!
    end
  end

  task :import_food_group => :environment do
    CSV.foreach("data.csv", col_sep: ",", :headers => true) do |row|
      food_group = FoodGroup.find_or_initialize_by(name: row[2])
      food_group.save!
    end
  end
end
