class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Phone number is too short, Input only number"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  # validates :phone_number, numericality: { greater_than_or_equal_to: 10, message: "is too short" }
  validates :token, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end