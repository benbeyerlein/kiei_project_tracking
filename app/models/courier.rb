class Courier < ActiveRecord::Base

  belongs_to :shipment

  has_many :delivery_types
  has_many :shipments

end
