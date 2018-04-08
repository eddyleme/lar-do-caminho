class Photo < ApplicationRecord
  belongs_to :album

  mount-uploader :photo, PhotoUploader

  before_save :update_photo_attributes

  private
    def update_photo_attributes
      if photo.present? && photo_changed?
        self.photo_content_type = photo.file.content_type
        self.photo_file_size = photo.file.size
      end
    end
end
