class TrackingDetail < ActiveRecord::Base

  validates :shipment_id, :presence => true, :uniqueness => {:scope => [:activity_datetime, :activity_note, :city, :state, :zip] }

  belongs_to :shipment

end
