class Ability < ActiveRecord::Base
  attr_accessible :title, :body

  def intialize(articles)
    @articles = articles
  end

end
