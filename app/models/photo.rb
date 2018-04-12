class Photo < ApplicationRecord
  belongs_to :album

  mount_uploader :photo_location, PhotoUploader

  #<<<<<
  #josh changes:
  # before_save :update_photo_attributes

  # private
  #   def update_photo_attributes
  #     if photo.present? && photo_changed?
  #       self.photo_content_type = photo.file.content_type
  #       self.photo_file_size = photo.file.size
  #     end
  #   end
end
