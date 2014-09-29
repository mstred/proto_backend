class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :long
      t.references :locationable, polymorphic: true

      t.timestamps
    end
  end
end
