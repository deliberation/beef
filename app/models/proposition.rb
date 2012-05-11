class Proposition < ActiveRecord::Base
  attr_accessible :text, :title, :user
  belongs_to :user
end
