class  ProductPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id,:token
  with_options presence: true do
    validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :municipality
    validates :address
    validates :phone_number, format:{with:/\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end
end