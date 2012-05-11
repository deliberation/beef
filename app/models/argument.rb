class Argument < ActiveRecord::Base
  attr_accessible :text, :side
  belongs_to :user
  belongs_to :proposition
  
  PRO = 'pro'
  CONTRA = 'contra'
  
  scope :pro, where(side: :pro)
  scope :contra, where(side: :contra)
  
end
