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

  timestamp = Time.now
  timestamp = "#{timestamp.hour}:#{timestamp.min}"

  growl = { message: params[:growl], timestamp: timestamp }

  if growl[:message].length > 142
    flash[:length] = "Your growl is too long"
    redirect '/'
  elsif growl[:message].empty?
    flash[:blank] = "Please enter text"
    redirect '/'
  else  
    session[:growls].push(growl)
    redirect '/'
  end

end

post '/clear' do
  session.clear

  redirect '/'
end
