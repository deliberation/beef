class PropositionsController < InheritedResources::Base
  
  def index
    return redirect_to new_user_session_path unless current_user
    index!
  end
  
  def import_from_lqfb
    current_user.propositions.import_from_lqfb(params[:import][:id])
    redirect_to propositions_path
  end
  
  
  
end