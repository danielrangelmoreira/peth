class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :physician_id
      t.date :ap_date

      t.timestamps
    end
  end
end
