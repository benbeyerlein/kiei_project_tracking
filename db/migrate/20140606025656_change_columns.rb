class ChangeColumns < ActiveRecord::Migration
  def change
    change_table :delivery_types do |t|
      t.rename :carrier_id, :courier_id
    end
    change_table :shipments do |t|
      t.rename :carrier_id, :courier_id
    end
    change_table :tracking_details do |t|
      t.rename :package_id, :shipment_id
    end


  end
end
