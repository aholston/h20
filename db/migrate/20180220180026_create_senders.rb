class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :credit_card
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
