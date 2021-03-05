class Order < ApplicationRecord
belongs_to :user, optional: true
has_many :order_products
has_one :charge
end
