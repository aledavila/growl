require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/formkeeper'
require 'sinatra/flash'

enable :sessions

before do
  session[:growls] ||= []
end

get '/' do

  @growls = session[:growls]
  erb :index

end

post '/growl' do

  growl = params[:growl]

  if growl.length > 142
    flash[:length] = "Your growl is too long"
    redirect '/'
  elsif growl.empty?
    flash[:blank] = "Please enter text"
    redirect '/'
  else  
    session[:growls].push(growl)
    redirect '/'
  end

end
