class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :country
      t.string :population_group
      t.string :food_group
      t.integer :subjects
      t.integer :consumers
      t.float :mean

      t.timestamps
    end
  end
end
