class UsersController < ApplicationController
  before_action :authorized, except: [:login, :create]
  #, only: [:auto_login]
  before_action :set_user, only: [:show]

  # GET /test
  def test
    @a = ['a':1, 'b':2]
    render json: @a
  end

  # GET /users
  def index
    @users = User.all
    render json: @users, :except =>  [:password_digest]
  end

  # REGISTER
  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      @now=DateTime.now
      render json: {user: @user}, :except =>  [:password_digest]
    else
      render json: @user
      # render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  # POST /login
  def login
    @user = User.find_by(name: params[:name])

    if @user && @user.authenticate(params[:password])
      @now=DateTime.now
      token = encode_token({user_id: @user.id, name:@user.name, iat: @now.to_time.to_i,exp:(@now+15.minutes).to_time.to_i })
      render json: {token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :password)
  end

end
