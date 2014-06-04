class Package < ActiveRecord::Base

  validates :tracking_number, uniqueness: true

  belongs_to :user
  belongs_to :carrier
  belongs_to :tracking_number_status

  has_many :tracking_details

end
