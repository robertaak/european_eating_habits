require 'csv'
namespace :db do
  task :import_csv => :environment do
    CSV.foreach("data.csv", :headers => true) do |row|
      Entry.create!(row.to_hash)
    end
  end
end
