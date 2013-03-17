class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :appointment_id
      t.text :content

      t.timestamps
    end
  end
end
