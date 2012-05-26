class ArgumentsController < InheritedResources::Base
  
  belongs_to :proposition
  
  def create
    raise if current_user.nil?
    @argument = Argument.new params[:argument]
    @argument.proposition = parent
    @argument.user = current_user
    create!{ proposition_path(parent)  }
  end
  
  def vote
    @argument = parent.arguments.find params[:argument_id]
    @argument.vote params[:vote], current_user
    render :json => {:success => true}
  end
  
  
end