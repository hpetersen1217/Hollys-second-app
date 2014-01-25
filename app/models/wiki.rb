class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public
  has_many :articles
  has_many :collaborations
  has_many :users, through: :collaborations
end
