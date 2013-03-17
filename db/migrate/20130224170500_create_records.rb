class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :appointment_id
      t.text :content

      t.timestamps
    end
  end
end
