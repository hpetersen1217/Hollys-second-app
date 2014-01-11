class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  attr_accessible :body, :article
end
