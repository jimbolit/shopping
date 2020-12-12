class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string  :address
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.decimal :total
      t.string :text
      t.string :comments
      t.timestamps
    end
  end
end