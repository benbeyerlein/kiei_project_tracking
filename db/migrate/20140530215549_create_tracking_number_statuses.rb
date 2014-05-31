class CreateTrackingNumberStatuses < ActiveRecord::Migration
  def change
    create_table :tracking_number_statuses do |t|
      t.string :status

      t.timestamps

    end
  end
end
