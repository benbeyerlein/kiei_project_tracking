class RenameCarriersToCouriers < ActiveRecord::Migration
  def change
    rename_table :carriers, :couriers
  end
end
