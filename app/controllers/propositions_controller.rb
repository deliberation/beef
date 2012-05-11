class PropositionsController < InheritedResources::Base
  
  def index
    return redirect_to new_user_session_path unless current_user
    index!
  end
  
  
  
  def begin_of_association_chain
    current_user
  end
  
end