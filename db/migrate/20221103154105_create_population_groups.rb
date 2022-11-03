class CreatePopulationGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :population_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
