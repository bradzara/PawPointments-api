class RenameDogIdToPetIdInAppointments < ActiveRecord::Migration[7.1]
  def change
    rename_column :appointments, :dog_id, :pet_id
  end
end
