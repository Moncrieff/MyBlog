class Post < ActiveRecord::Base
  validates :header, presence: true
end
