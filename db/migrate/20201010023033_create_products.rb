class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.string :amount
      t.string :image
      t.decimal :price
      t.timestamps
    end
  end
end
