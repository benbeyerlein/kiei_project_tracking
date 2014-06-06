class Carrier < ActiveRecord::Base

  belongs_to :package

  has_many :delivery_types #, dependent: :destroy
  has_many :packages #, dependent: :destroy

end
