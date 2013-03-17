class AddRecordIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :record_id, :integer
  end
end
