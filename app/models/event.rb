class Event < ApplicationRecord
		mount_uploader :display_photo, PhotoUploader
	has_many :packages, dependent: :destroy
	validates :display_photo, presence: true
end
