class Album < ApplicationRecord
	mount_uploader :cover_photo, PhotoUploader
	has_many :photos, dependent: :destroy
	validates :cover_photo, :album_title, presence: true
end
