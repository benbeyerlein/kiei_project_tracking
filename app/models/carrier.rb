class Carrier < ActiveRecord::Base

  belongs_to :package

  has_many :delivery_types
  has_many :packages

end
