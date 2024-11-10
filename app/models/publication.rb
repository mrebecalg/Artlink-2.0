class Publication < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
