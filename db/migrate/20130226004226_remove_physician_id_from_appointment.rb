class RemovePhysicianIdFromAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :physician_id
  end
end
