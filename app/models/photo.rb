class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  serialize :photos, JSON
  belongs_to :user
end
