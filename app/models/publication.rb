class Publication < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :picture, presence: true
  belongs_to :user
  has_many :requests

  def average_rating
    return 0 if requests.empty?

    total_rating = requests.where.not(rating: nil).sum(:rating)
    count = requests.where.not(rating: nil).count
    total_rating.to_f / count
  end
end
