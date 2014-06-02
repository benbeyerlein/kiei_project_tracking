class Package < ActiveRecord::Base

  validates :tracking_number, uniqueness: true

  belongs_to :user
  belongs_to :carrier

  has_many :tracking_details
  has_many :tracking_number_statuses
end
