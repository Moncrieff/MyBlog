class Post < ActiveRecord::Base
  validates_presence_of :header, :reading_time, :excerpt, :body
  validates :reading_time, numericality: true
  mount_uploader :attachment, AttachmentUploader
end
