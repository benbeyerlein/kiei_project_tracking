class Package < ActiveRecord::Base

  belongs_to :user
  belongs_to :carrier

  has_many :tracking_details
  has_many :tracking_number_statuses
end
