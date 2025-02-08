class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_arrival
      t.date :date_departure

      t.timestamps
    end
  end
end
