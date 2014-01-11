class Article < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :wiki
  belongs_to :user
  has_many :comments
end
