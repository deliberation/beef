class ArgumentsController < InheritedResources::Base
  
  belongs_to :proposition
  
  def create
    create!{ proposition_path(parent)  }
  end
  
  
end