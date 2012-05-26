class Argument < ActiveRecord::Base
  attr_accessible :text, :side
  belongs_to :user
  belongs_to :proposition
  has_many :argument_votes
  
  
  PRO = 'pro'
  CONTRA = 'contra'
  
  STARS = 5
  
  MAX_RMS = STARS.to_f / 2 
  
  scope :ranked, order('arguments.weight DESC')
  scope :pro, ranked.where(side: :pro)
  scope :contra, ranked.where(side: :contra)
  
  def self.ids
    select(:id).map &:id
  end
  
  
  def relative_vote weight, user
    vote = argument_vote user
    vote.weight = weight
    vote.save!
    
    weight_sum = relating_votes(user).sum :weight
    
    relating_votes(user).each do |rv|
      rv.relative_weight = (rv.weight == 0) ? 0 : rv.weight / weight_sum # prevent division by zero
      rv.save!
    end
    
    relating_arguments.each do |argument|
      argument.relative_weight = argument.argument_votes.average :relative_weight
      argument.save!
    end
  end
  
  def weight_rms_percent
    (100 * weight_rms).round
  end
  
  def vote weight, user
    vote = argument_vote user
    vote.weight = weight
    vote.save!
    
    self.voted = true
    self.weight = argument_votes.average :weight
    self.weight_rms = _weight_rms
    save!
  end
  
  protected
    
    # RMS is root mean square
    # 0 : max aggreemend, 1 : max disagreement
    def _weight_rms
      Math.sqrt(argument_votes.map{ |v|
        (v.weight.to_f - weight) ** 2
      }.sum).to_f / MAX_RMS
    end
    
    def relating_arguments
      proposition.arguments.where(side: self.side)
    end
    
    def argument_vote user
      argument_votes.where(:user_id => user.id).first ||
      ArgumentVote.new(:user => user, :argument => self)
    end
    
    def relating_votes user
      @relating_votes ||= ArgumentVote.where(
        :user_id => user.id, 
        :argument_id => relating_arguments.ids
       )
    end
  
end
