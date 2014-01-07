class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public
  has_many :articles
end
