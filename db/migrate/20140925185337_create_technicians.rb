class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gcm_id

      t.timestamps
    end
  end
end
