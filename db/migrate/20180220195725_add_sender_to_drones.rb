class AddSenderToDrones < ActiveRecord::Migration
  def change
    add_column :drones, :sender, :integer
    add_column :drones, :reciever, :integer
  end
end
