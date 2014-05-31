class CreateTrackingDetails < ActiveRecord::Migration
  def change
    create_table :tracking_details do |t|
      t.integer :package_id
      t.datetime :activity_datetime
      t.string :city
      t.string :state
      t.string :zip
      t.string :activity_note

      t.timestamps

    end
  end
end
