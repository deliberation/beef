class Proposition < ActiveRecord::Base
  attr_accessible :text, :title, :user
  belongs_to :user
  has_many :arguments
  
  
  def self.import_from_lqfb(lqfb_id)
    data = LQFB::Initiative.get(id: lqfb_id.to_s)
    prop = new(
      title: data['name'],
      text: data['current_draft_content']
    )
    prop.lqfb_identifier = data['id']
    prop.save!
    prop
  end
  
  
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
