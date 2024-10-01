class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  def index
    @appointments = Appointment.all
    render :index
  end

  def show
    render :show
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render :show, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render :show
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.permit(:pet_id, :date, :start_time, :end_time, :description, :notes)
  end
end
