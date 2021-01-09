class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :person

  with_options presence: true do
    validates :image
    validates :name
    validates :person_id
    validates :material
    validates :step1
  end

  # 人数分の選択が「--」の時は保存できないようにする
  validates :person_id, numericality: { other_than: 0 }
end
