require 'active_shipping'
include ActiveMerchant::Shipping

usps = USPS.new(:login => '956INDEP1007', :password => '270MX72FS959')
tracking_info = usps.find_tracking_info('9405510200986253264474')

tracking_info.shipment_events.each do |event|
  puts "#{event.name} at #{event.location.city}, #{event.location.state} #{event.location.zip} on #{event.time}. #{event.message}"
end
