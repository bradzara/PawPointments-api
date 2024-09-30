class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.integer :dog_id
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
