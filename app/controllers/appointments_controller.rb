class AppointmentsController < ApplicationController
  before_action :authenticate_user

  def index
    @appointments = Appointment.includes(:pet).all
    render json: @appointments.as_json(include: :pet, methods: [:formatted_start_time, :formatted_end_time])
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    render json: @appointment.as_json(include: :pet, methods: [:formatted_start_time, :formatted_end_time])
  end

  def create
    parsed_start_time = Time.parse(appointment_params[:start_time]).strftime("%H:%M")
    parsed_end_time = Time.parse(appointment_params[:end_time]).strftime("%H:%M")
    
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
    params.require(:appointment).permit(:pet_id, :date, :start_time, :end_time, :description, :notes)
  end
end
