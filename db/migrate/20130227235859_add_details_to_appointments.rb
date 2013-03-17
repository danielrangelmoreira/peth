class AddDetailsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :local, :string
    add_column :appointments, :type, :string
  end
end
