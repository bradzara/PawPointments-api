class OwnersController < ApplicationController

  def index
    @owners = Owner.all
    render :index
  end

  def show
    @owner = Owner.find_by(id: params[:id])
    render :show
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      render json: @owner, status: :created
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  def update
    @owner = Owner.find_by(id: params[:id])
    if @owner.update(owner_params)
      render json: @owner
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @owner = Owner.find_by(id: params[:id])
    @owner.destroy
    render json: { message: "Owner succesfully deleted" }
  end
  
  private

  def owner_params
    params.permit(:name, :email, :phone, :address)
  end
end
