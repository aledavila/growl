require 'sinatra'
require 'sinatra/reloader'

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
  session[:growls].push(growl)

  redirect '/'

end
