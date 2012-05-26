class ArgumentVote < ActiveRecord::Base
  attr_accessible :weight, :argument, :user
  belongs_to :user
  belongs_to :argument
  
end
