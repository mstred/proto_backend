class AddGcmIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :gcm_id, :string
  end
end
