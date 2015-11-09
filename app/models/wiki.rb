class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators #=> [User1, User3, User17]
  
  def public?
      !private?
  end
  
  def collaborator_for(user)
      collaborators.find_by(user: user)
  end
 
end
