class UsersController < ApplicationController
  def show
    @user = current_user
    render :show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: @pet, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User has successfully been deleted" }
  end

  private

  def user_params
    params.permit(:id, :username, :first_name, :last_name, :email, :phone, :password, :password_confirmation, :profile_picture)
  end
end
