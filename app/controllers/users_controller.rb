class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :update, :destroy, :current_user]
  
  def show
    @user = User.find_by(id: params[:id])
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

  def current_user
    render json: @current_user.as_json(only: [:id, :username, :first_name, :last_name, :email, :phone]).merge(
      profile_picture_url: @current_user.profile_picture.attached? ? url_for(@current_user.profile_picture) : nil
    ), status: :ok
  end
  

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base), true, { algorithm: 'HS256' })
    @current_user = User.find(decoded_token[0]['user_id'])
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  private

  def user_params
    params.permit(:id, :username, :first_name, :last_name, :email, :phone, :password, :password_confirmation, :profile_picture)
  end
end
