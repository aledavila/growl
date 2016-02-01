require 'bcrypt'
require 'yaml'

class User
  include BCrypt
  attr_reader :name

  def self.authenticate(params = {})
    return nil if params[:username].blank? || params[:password].blank?
    session[:user] = params[:username]
  end

end