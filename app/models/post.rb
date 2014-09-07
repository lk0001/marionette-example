class Post < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
end
