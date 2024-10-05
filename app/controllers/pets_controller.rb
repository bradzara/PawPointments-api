class PetsController < ApplicationController
before_action :authenticate_user

def index
  @pets = current_user.pets.includes(:owner)
  render :index
end

def show
  @pet = Pet.find_by(id: params[:id])
  render :show
end

def create
  owner_attributes = pet_params[:owner_attributes]

  @owner = Owner.find_by(email: owner_attributes[:email])

  if @owner.nil?
    @owner = Owner.create(owner_attributes)
  end
  
  @pet = current_user.pets.build(pet_params)

  if @pet.save
    render json: @pet, status: :created
  else
    Rails.logger.debug(@pet.errors.full_messages)
    render json: @pet.errors, status: :unprocessable_entity
  end
end

def update
  @pet = Pet.find_by(id: params[:id])
  if @pet.update(pet_params)
    render json: @pet, status: :ok
  else
    render json: @pet.errors, status: :unprocessable_entity
  end
end

def destroy
  @pet = Pet.find_by(id: params[:id])
  @pet.destroy
  render json: { message: "Pet succesfully deleted" }
end

private

def pet_params
  params.require(:pet).permit(:name, :breed, :age, :owner_id, :notes, :image, :user_id, owner_attributes: [:name, :email, :phone, :address])
end
end
