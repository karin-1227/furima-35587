class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :price, numericality:{with:/\A[0-9]+\z/}
  end

  belongs_to :user

  has_one_attached :image
  belongs_to :category 
  belongs_to :state 
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end
