class Request < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  belongs_to :publication
  mount_uploader :picture, PictureRequestUploader
  validates :title, presence: true
  validates :description, presence: true
  validates :contact, presence: true
  validates :picture, presence: true
  validates :status, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true

  after_save :update_publication_rating, if: :saved_change_to_rating?

  private

  def update_publication_rating
    Rails.logger.info "Updating publication rating for publication ID: #{publication.id}"
    publication.average_rating
  end
end
