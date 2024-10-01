class PetsController < ApplicationController
before_action :set_pet, only: [:show, :update, :destroy]

def index
  @pets = Pet.all
  render :index
end

def show
  @pet = Pet.find_by(id: params[:id])
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
  if @pet.update(pet_params)
    render json: @pet, status: :ok
  else
    render json: @pet.errors, status: :unprocessable_entity
  end
end

def destroy
  @pet.destroy
  head :no_content
end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Pet not found" }, status: :not_found
  end

  def pet_params
    params.permit(:name, :breed, :age, :owner_id, :notes, :image)
  end
end
