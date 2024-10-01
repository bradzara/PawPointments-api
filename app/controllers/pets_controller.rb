class PetsController < ApplicationController

def index
  @pets = Pet.all
  render :index
end

def show
  @pet = Pet.find_by(id: params[:id])
  render :show
end

def create
  @pet = Pet.new(pet_params)

  if @pet.save
    render json: @pet, status: :created
  else
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
  params.permit(:name, :breed, :age, :owner_id, :notes, :image)
end
end
