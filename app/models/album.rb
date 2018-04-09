class Album < ApplicationRecord
	mount_uploader :cover_photo, PhotoUploader
	has_many :photos, dependent: :destroy
end
