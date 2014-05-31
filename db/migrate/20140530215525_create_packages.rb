class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :sender_name
      t.date :send_date
      t.text :notes
      t.integer :carrier_id
      t.string :tracking_number
      t.integer :delivery_type_id
      t.integer :user_id
      t.integer :tracking_number_status_id

      t.timestamps

    end
  end
end
