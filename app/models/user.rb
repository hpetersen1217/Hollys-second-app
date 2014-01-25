class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :articles
  has_many :comments
  has_many :collaborations
  has_many :wikis, through: :collaborations
  
  before_create :set_member


  private

  def set_member
    self.role = 'member'
  end
  # attr_accessible :title, :body
end
