require 'sinatra/base'
require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require './lib/peep'
require './lib/user'
require_relative './data_mapper_setup'




class Chitter < Sinatra::Base
  use Rack::Flash, :sweep => true 
  enable :sessions
  set :session_secret, 'this is secret'


  get '/' do
    @peeps = Peep.all
    erb :index 
  end

  get '/user/register' do
    @user = User.new
    erb :"users/register"
  end

  get '/session/end' do
    @peeps = Peep.all
    flash[:bye] = "Goodbye, #{current_user.name}"
    session[:user_id] = nil
    erb :index
  end

  post '/peeps/new' do
    p session[:user_id]
    @peep = Peep.create(:peep => params[:new_peep], :user_id => session[:user_id])
    redirect to('/')
  end

  post '/sessions/new' do
    email, password = params[:email], params[:password]
    @user = User.authenticate(email,password)
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:errors] = ["The email or password is incorrect"]
      @peeps = Peep.all
      erb :index
    end
  end

  post '/users' do
    @user = User.create(:name => params[:name],
                        :username => params[:username], 
                        :email => params[:email], 
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/register"
    end
  end

  helpers do
    def current_user 
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
