class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis
  
  after_initialize :set_role
  
  enum role: [:standard, :premium, :admin]
  
  def set_role
    self.role ||= :standard
  end

  
  
end
