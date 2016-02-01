module Authentication
  def authenticate!
    unless session[:user]
      redirect '/login'
    end
  end
end