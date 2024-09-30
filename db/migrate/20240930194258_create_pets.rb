class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.integer :owner_id
      t.text :notes

      t.timestamps
    end
  end
end
