class RemoveUserFromDrones < ActiveRecord::Migration
  def change
    remove_reference :drones, :user, index: true, foreign_key: true
  end
end
