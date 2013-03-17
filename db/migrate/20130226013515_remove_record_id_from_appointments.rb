class RemoveRecordIdFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :record_id
  end
end
