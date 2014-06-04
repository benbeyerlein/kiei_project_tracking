class TrackingDetail < ActiveRecord::Base

  validates :package_id, :presence => true, :uniqueness => {:scope => [:activity_datetime, :activity_note, :city, :state, :zip] }

  belongs_to :package

end
