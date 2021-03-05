class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.belongs_to :order
      t.text :status
      t.text :stripe_id

      t.timestamps
    end
  end
end
