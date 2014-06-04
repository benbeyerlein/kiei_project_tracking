class DeliveryType < ActiveRecord::Base

  belongs_to :package
  belongs_to :carrier

end
