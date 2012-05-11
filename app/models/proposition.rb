class Proposition < ActiveRecord::Base
  attr_accessible :text, :title, :user
  belongs_to :user
  has_many :arguments
end
