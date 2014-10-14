class AddAccessTokenToTechnician < ActiveRecord::Migration
  def change
    add_column :technicians, :access_token, :string
  end
end
