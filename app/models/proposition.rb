class Proposition < ActiveRecord::Base
  attr_accessible :text, :title, :user
  belongs_to :user
  has_many :arguments
  
  
  def argument_weights side, user
    @weights ||= Hash[
      argument_votes(side, user).map{|v| 
       [v.argument.id, v.weight]
      }
    ]
  end
  
  
  def argument_votes side, user
    @votes ||= ArgumentVote.where(
      :'argument_votes.user_id' => user.id,
    ).joins(:argument).
    where('arguments.proposition_id = ?', self.id).
    where('arguments.side = ?', side.to_s)
  end
  
end
