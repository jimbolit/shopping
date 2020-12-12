class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :order_quantity
      t.timestamps
    end
  end
end
