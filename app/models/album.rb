class Album < ApplicationRecord
	mount_uploader :cover_image, ImageUploader
	has_many :photos, dependent: :destroy
end
