class DeliveryType < ActiveRecord::Base

  belongs_to :shipment
  belongs_to :courier

end
