class PropositionsController < InheritedResources::Base
  
  def index
    return redirect_to new_user_session_path unless current_user
    index!
  end
  
  
  
end