class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :explain
    validates :user_id
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, in: 300..9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :cost_id
    validates :region_id
    validates :period_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Quality
  belongs_to :Cost
  belongs_to :Region
  belongs_to :Period
end
