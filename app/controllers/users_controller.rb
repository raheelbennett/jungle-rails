class UsersController < ApplicationController

  def new
    @user = User.new
    pp "Test Create User", @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      pp "i'm here", 
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      pp "printing the sesion", session[:user_id]
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end   

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
