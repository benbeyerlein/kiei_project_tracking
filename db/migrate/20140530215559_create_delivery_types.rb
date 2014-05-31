class CreateDeliveryTypes < ActiveRecord::Migration
  def change
    create_table :delivery_types do |t|
      t.integer :carrier_id
      t.string :delivery_type
      t.string :tracking_number_format
      t.string :tracking_number_checksum

      t.timestamps

    end
  end
end
