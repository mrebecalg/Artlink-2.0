class Request < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  belongs_to :publication
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :description, presence: true
  validates :contact, presence: true
  validates :picture, presence: true
end
