class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    render :index
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
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
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.update(appointment_params)
      render :show
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.destroy
    render json: { message: "Appointment succesfully deleted" }
  end

  private

  def appointment_params
    params.permit(:pet_id, :date, :start_time, :end_time, :description, :notes)
  end
end
