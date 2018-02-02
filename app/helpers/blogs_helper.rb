module BlogsHelper
  
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end