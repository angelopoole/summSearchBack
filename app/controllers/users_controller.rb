class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

  def persist
    wristband = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: wristband }
  end


  def create
    @user = User.create(user_params)
    if @user.valid?
      wristband = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: wristband }, status: 201
    else
      render json: {error: "NICE TRY"}, status: 401
    end
  
end 

def follow
  @user = User.find_by(username: params[:username])
  tofollow = User.find_by(tofollow: params[:tofollow])
  @user.validify_follow(@user, tofollow)

  @user.followers << tofollow

end

  def console
    puts "Hello im coming from postman!"
  end


  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      wristband = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: wristband }
    else
      render json: {error: "Failed to log in"}, status: 401
    end
  end


  private

  def user_params
    params.permit(:username, :password)
  end

end
