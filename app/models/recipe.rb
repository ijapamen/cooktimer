class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :person

  validate :image_content_type, :image_size, if: Proc.new {|recipe| recipe.image.present?}
  
  def image_content_type
    if !image.content_type.in?(%('image/png', 'image/jpg', 'image/jpeg'))
      errors.add(:image, "にはjpegまたはpngファイルを添付してください")
    end
  end

  def image_size
    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "は5MB以内にしてください")
    end
  end

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
