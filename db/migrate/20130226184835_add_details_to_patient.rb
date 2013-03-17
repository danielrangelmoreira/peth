class AddDetailsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :address, :string
    add_column :patients, :city, :string
    add_column :patients, :dob, :date
    add_column :patients, :postal_code, :integer
    add_column :patients, :state, :string
    add_column :patients, :rghc, :string
    add_column :patients, :phone, :string
  end
end
