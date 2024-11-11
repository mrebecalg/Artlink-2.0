class Publication < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
