require 'sinatra/base'
require 'data_mapper'
require 'sinatra'
require 'rack-flash'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/peep'
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

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
      flash[:notice] = "Your passwords don't match. Please try again."
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
