class Appointment < ApplicationRecord
  #Associations
  belongs_to :pet

  #Validations
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  #Custom validation to ensure the end time is after the start time
  def end_time_after_start_time
    return if end_time.blank? || start.time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
