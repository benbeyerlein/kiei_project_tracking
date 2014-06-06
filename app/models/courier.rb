class Courier < ActiveRecord::Base

  belongs_to :shipment

  has_many :delivery_types #, dependent: :destroy
  has_many :shipments #, dependent: :destroy

end
