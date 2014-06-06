class RenamePackageToShipment < ActiveRecord::Migration
  def change
    rename_table :packages, :shipments
  end
end
