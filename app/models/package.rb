class Package < ActiveRecord::Base

  validates :tracking_number, uniqueness: true

  belongs_to :user
  belongs_to :carrier
  belongs_to :tracking_number_status

  has_many :tracking_details

  require 'active_shipping'
  include ActiveMerchant::Shipping

   def self.track(tracking_number)

    usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
    tracking_info = usps.find_tracking_info("#{tracking_number}")

    tracking_info.shipment_events.each do |event|
      puts "#{event.name} at #{event.location.city}, #{event.location.state} #{event.location.zip} on #{event.time}. #{event.message}"

      # @tracking_detail = TrackingDetail.new
      # @tracking_detail.package_id = 2
      # @tracking_detail.activity_datetime = event.time
      # @tracking_detail.city = event.location.city
      # @tracking_detail.state = event.location.state
      # @tracking_detail.zip = event.location.zip
      # @tracking_detail.activity_note = event.name
      # @tracking_detail.save

    end
    # usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
    # tracking_info = usps.find_tracking_info('9405510200986253264474')

    # tracking_info.shipment_events.each do |event|
    #   puts "#{event.name} at #{event.location.city}, #{event.location.state} #{event.location.zip} on #{event.time}. #{event.message}"

    #   @tracking_detail = TrackingDetail.new
    #   @tracking_detail.package_id = 2
    #   @tracking_detail.activity_datetime = event.time
    #   @tracking_detail.city = event.location.city
    #   @tracking_detail.state = event.location.state
    #   @tracking_detail.zip = event.location.zip
    #   @tracking_detail.activity_note = event.name
    #   @tracking_detail.save

    # end

    # @tracking_details = TrackingDetail.where(package_id: 2)

  end

end
