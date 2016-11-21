module UserHelper
  def get_name
    @user = User.all
    return (@user.find(session[:id_client]).nom + " " + @user.find(session[:id_client]).prenom)
  end
end
