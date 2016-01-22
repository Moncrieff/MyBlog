class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank
  validates_presence_of :header, :reading_time, :excerpt, :body
  validates :reading_time, numericality: true
end
