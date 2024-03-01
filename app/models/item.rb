class Item < ApplicationRecord
  validates :image,              presence: true
  validates :name,               presence: true
  validates :content,            presence: true
  validates :category_id,        numericality: { other_than: 1 }
  validates :status_id,          numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id,   numericality: { other_than: 1 }
  validates :delivery_date_id,   numericality: { other_than: 1 }
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image

end
