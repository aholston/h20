class CreateDrones < ActiveRecord::Migration
  def change
    create_table :drones do |t|
      t.references :sender, index: true, foreign_key: true
      t.references :reciever

      t.timestamps null: false
    end
  end
end
