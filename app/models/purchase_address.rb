class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :home_number, :building, :phone_number, :user_id, :item_id, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :home_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :region_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(purchase_id: purchase.id, post_code:, region_id:, city:, home_number:,
                   phone_number:, building:)
  end
end
